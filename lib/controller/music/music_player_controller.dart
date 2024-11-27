import 'package:atempo_app/model/music_data.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerController extends GetxController {
  late AudioPlayer _audioPlayer;
  final Rx<Duration> position = Duration.zero.obs; // 현재 재생 위치
  final Rx<Duration> duration = Duration.zero.obs; // 총 길이

  final RxBool isPlaying = false.obs; // 재생 여부 확인
  final RxBool hasNext = false.obs; // 다음 곡 여부 확인
  final RxBool hasPrevious = false.obs; // 이전 곡 여부 확인
  final RxBool isShuffleEnabled = false.obs; // 랜덤 재생 여부
  final RxString currentTrackTitle = 'Unknown Track'.obs; // 현재 재생 중인 곡 제목
  final RxString currentTrackCoverUrl = ''.obs; // 현재 곡 앨범커버 이미지
  final RxList<Music> playlist = <Music>[].obs; // 재생목록

  // 좋아요/싫어요 관리 리스트
  final List<Music> likedTracks = []; // 좋아요 한 곡 리스트
  final List<Music> dislikedTracks = []; // 싫어요 한 곡 리스트

  // Firebase 데이터 로딩 여부
  bool isPlaylistLoaded = false;

  // 기본 제목과 이미지
  static const defaultTitle = 'Unknown Title';
  static const defaultImageUrl = 'assets/images/music_bg7.png';

  @override
  void onInit() {
    super.onInit();
    _audioPlayer = AudioPlayer();

    // Firebase에서 음악 목록을 불러와 재생 목록 초기화
    loadPlaylistFromFirebase();

    // 스트림 리스너 설정
    _audioPlayer.positionStream.listen((p) => position.value = p);
    _audioPlayer.durationStream
        .listen((d) => duration.value = d ?? Duration.zero);
    _audioPlayer.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
      hasNext.value = _audioPlayer.hasNext;
      hasPrevious.value = _audioPlayer.hasPrevious;
    });

    // 현재 재생 중인 인덱스가 변경될 때 제목 및 커버 이미지 업데이트
    _audioPlayer.currentIndexStream.listen((index) {
      if (index != null && index < playlist.length) {
        currentTrackTitle.value = playlist[index].musicTitle;
        currentTrackCoverUrl.value = playlist[index].musicImgUrl;
      }
    });
  }

  // Firebase에서 음악 파일 목록을 가져와 재생 목록 설정
  Future<void> loadPlaylistFromFirebase() async {
    if (isPlaylistLoaded) {
      print("Playlist already loaded. Skipping re-fetch.");
      return;
    }

    final storage = FirebaseStorage.instance;
    List<AudioSource> audioSources = [];

    try {
      final ListResult result = await storage.ref('music').listAll();

      // albumContents의 키와 값을 리스트로 변환
      final titles = albumContents.keys.toList();
      final imageUrls = albumContents.values.toList();

      // 병렬 처리로 순차 매핑
      final tracks =
          await Future.wait(result.items.asMap().entries.map((entry) async {
        final index = entry.key; // Firebase 파일 순서
        final item = entry.value;

        final downloadUrl = await item.getDownloadURL();
        final trackDuration = await _getAudioDuration(downloadUrl);

        // 순차적으로 title과 imageUrl 가져오기
        final title = index < titles.length ? titles[index] : defaultTitle;
        final imageUrl =
            index < imageUrls.length ? imageUrls[index] : defaultImageUrl;

        return Music(
          musicTitle: title,
          musicUrl: downloadUrl,
          musicImgUrl: imageUrl,
          runningTime: trackDuration ?? Duration.zero,
          musicDescription: '행복해지기 위한 노래',
        );
      }));

      // playlist 업데이트
      playlist.addAll(tracks);

      // 오디오 소스 추가
      audioSources = tracks
          .map((track) => AudioSource.uri(Uri.parse(track.musicUrl)))
          .toList();

      // 오디오 플레이어에 재생 목록 설정
      await _audioPlayer
          .setAudioSource(ConcatenatingAudioSource(children: audioSources));

      isPlaylistLoaded = true; // 로드 완료 상태 업데이트
      print("Playlist initialized with ${audioSources.length} tracks.");
    } catch (e) {
      print("Error loading playlist from Firebase: $e");
    }
  }

  // URL에서 재생 시간을 가져오는 메서드 (임시 AudioPlayer 사용)
  Future<Duration?> _getAudioDuration(String url) async {
    AudioPlayer tempPlayer = AudioPlayer();
    try {
      await tempPlayer.setUrl(url);
      return tempPlayer.duration;
    } catch (e) {
      print("Error getting duration: $e");
      return null;
    } finally {
      await tempPlayer.dispose();
    }
  }

  // 재생 및 일시정지
  void playPause() {
    isPlaying.value ? _audioPlayer.pause() : _audioPlayer.play();
  }

  // 다음 곡 재생
  void nextTrack() {
    if (hasNext.value) {
      _audioPlayer.seekToNext();
    }
  }

  // 이전 곡 재생
  void previousTrack() {
    if (hasPrevious.value) {
      _audioPlayer.seekToPrevious();
    }
  }

  // 셔플 모드 설정
  void toggleShuffle() {
    isShuffleEnabled.value = !isShuffleEnabled.value;
    _audioPlayer.setShuffleModeEnabled(isShuffleEnabled.value);
  }

  // 특정 위치로 이동
  void seekTo(Duration position) {
    _audioPlayer.seek(position);
  }

  // 좋아요 기능 토글
  void toggleLike(Music track) {
    if (likedTracks.contains(track)) {
      likedTracks.remove(track);
    } else {
      likedTracks.add(track);
      dislikedTracks.remove(track); // 싫어요에서 제거
    }
  }

  // 싫어요 기능 토글
  void toggleDislike(Music track) {
    if (dislikedTracks.contains(track)) {
      dislikedTracks.remove(track);
    } else {
      dislikedTracks.add(track);
      likedTracks.remove(track); // 좋아요에서 제거
    }
  }

  // 특정 인덱스로 이동하고 재생하는 메서드
  void playTrackAtIndex(int index) {
    if (index >= 0 && index < playlist.length) {
      _audioPlayer.seek(Duration.zero, index: index);
      _audioPlayer.play();
    } else {
      print("Invalid index: $index");
    }
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
