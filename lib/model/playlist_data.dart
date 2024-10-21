// 테마별 음악 리스트를 위한 클래스
import 'package:atempo_app/model/emotion_data.dart';

import 'music_data.dart';

class Playlist {
  final String titleText;
  final String subTitleText;
  final String imageUrl;
  final MainEmotion emotionType; //mainEmotion
  final List<Music>? musicList;

  Playlist({
    required this.titleText,
    required this.subTitleText,
    required this.imageUrl,
    required this.emotionType,
    this.musicList,
  });
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
    imageUrl: "image_back2.jpg",
    emotionType: MainEmotion.angry,
  ),
  Playlist(
    titleText: "평화로운 날",
    subTitleText: "아주 평온했던 하루",
    imageUrl: "image_back3.jpg",
    emotionType: MainEmotion.peace,
  ),
  Playlist(
    titleText: "혼란스러운 날",
    subTitleText: "무엇을 해야 할지 모르겠던 날",
    imageUrl: "image_back4.jpg",
    emotionType: MainEmotion.confused,
  ),
];
