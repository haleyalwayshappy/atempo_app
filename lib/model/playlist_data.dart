// 테마별 음악 리스트를 위한 클래스
import 'package:atempo_app/model/emotion_data.dart';

import 'music_data.dart';

class Playlist {
  final String titleText;
  final String subTitleText;
  final String imageUrl;
  final MainEmotion emotionType; //mainEmotion
  List<Music>? musicList;
  // final List<Music>? likeList; // 좋아요리스트
  // final List<Music>? dislikeList; // 싫어요리스트

  Playlist({
    required this.titleText,
    required this.subTitleText,
    required this.imageUrl,
    required this.emotionType,
    this.musicList,
  });

  /// firebasedptj 음악 리스트를 가져오는 메소드

  // Future<void> loadMusicListFromFirebase() async {
  //   final firestore = FirebaseFirestore.instance;
  //   final storage = FirebaseStorage.instance;
  //   List<Music> loadedMusicList = [];
  //
  //   try {
  //     // Firestore에서 오디오 메타데이터 가져오기
  //     final QuerySnapshot snapshot =
  //         await firestore.collection('audio_metadata').get();
  //
  //     for (var doc in snapshot.docs) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //
  //       // Storage에서 파일 URL 가져오기
  //       final String musicUrl =
  //           await storage.ref(data['musicUrl']).getDownloadURL();
  //
  //       // Firestore에서 가져온 메타데이터와 Storage URL로 Music 객체 생성
  //       final Music music = Music(
  //         musicId: doc.id,
  //         musicImgUrl:
  //             data['musicImgUrl'] ?? "https://example.com/default-image.jpg",
  //         musicTitle: data['musicTitle'] ?? "Unknown Title",
  //         musicDescription: data['musicDescription'],
  //         runningTime:
  //         musicUrl: musicUrl,
  //       );
  //
  //       loadedMusicList.add(music);
  //     }
  //
  //     musicList = loadedMusicList;
  //   } catch (e) {
  //     print("음악리스트 가져오는데 실패했습니다 . : $e");
  //   }
  // }

  /// 디폴트 리스트 불러오는 메소드 하나 추가한다.
  /// 리턴 musicList

  /// 필터라는 메소드를 만든다 (좋아요)
  ///
  /// musiclist를 재정렬하는 행위
  /// 파라미터로 페이보릿을 받는다.
  /// like 면 재생이 처음되게끔
  /// dislike면 재생을 빼게끔
  /// 리턴 musicList
}

List<Playlist> dummyContentData = [
  Playlist(
    titleText: "오늘의 기분",
    subTitleText: "기분이 좋았던 하루",
    imageUrl: "image_back4.jpg",
    emotionType: MainEmotion.joy,
  ),
  Playlist(
    titleText: "슬픈 날",
    subTitleText: "아쉬운 일이 있었던 날",
    imageUrl: "image_back.jpg",
    emotionType: MainEmotion.sad,
  ),
  Playlist(
    titleText: "화가 난 날",
    subTitleText: "짜증나는 일이 많았던 날",
    imageUrl: "music_bg2.png",
    emotionType: MainEmotion.angry,
  ),
  Playlist(
    titleText: "평화로운 날",
    subTitleText: "아주 평온했던 하루",
    imageUrl: "image_back3.jpg",
    emotionType: MainEmotion.peaceful,
  ),
  Playlist(
    titleText: "혼란스러운 날",
    subTitleText: "무엇을 해야 할지 모르겠던 날",
    imageUrl: "image_back4.jpg",
    emotionType: MainEmotion.confused,
  ),
];
