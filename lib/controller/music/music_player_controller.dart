import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerController extends GetxController {
  late AudioPlayer _audioPlayer;
  final Rx<Duration> position = Duration.zero.obs;  // 현재 재생 위치
  final Rx<Duration> duration = Duration.zero.obs;  // 총 길이

  final RxBool isPlaying = false.obs; // 재생 여부 확인
  final RxBool hasNext = false.obs;   // 다음 곡 여부 확인
  final RxBool hasPrevious = false.obs; // 이전 곡 여부 확인
  final RxString currentSongTitle = 'Unknown Song'.obs; // 현재 재생곡 제목
  final RxString albumCoverUrl = ''.obs; // 앨범커버 이미지
  @override
  void onInit() {
    super.onInit();
    _audioPlayer = AudioPlayer();
    _initAudio();
    _audioPlayer.positionStream.listen((p) {
      position.value = p;
    });
    _audioPlayer.durationStream.listen((d) {
      duration.value = d ?? Duration.zero;
    });
    _audioPlayer.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
      currentSongTitle.value = 'song title';
      hasNext.value = _audioPlayer.hasNext;
      hasPrevious.value = _audioPlayer.hasPrevious;
      albumCoverUrl.value = 'https://your-image-url.com';
    });
  }

  Future<void> _initAudio() async {
    await _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(Uri.parse('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3')),
          AudioSource.uri(Uri.parse('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3')),
          AudioSource.uri(Uri.parse('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3')),
        ],
      ),
    );
  }

  // 재생 및 일시정지
  void playPause() {
    if (isPlaying.value) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  // 다음 곡
  void nextSong() {
    if (hasNext.value) {
      _audioPlayer.seekToNext();
    }
  }

  // 이전 곡
  void previousSong() {
    if (hasPrevious.value) {
      _audioPlayer.seekToPrevious();
    }
  }

  // 특정 위치로 이동
  void seekTo(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
