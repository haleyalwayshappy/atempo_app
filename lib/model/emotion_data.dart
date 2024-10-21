// TODO Enum Class로 변경해야한다.

import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

enum MainEmotion {
  sad([SubEmotion.calm, SubEmotion.depressed, SubEmotion.sorrow]),
  joy([SubEmotion.lonely, SubEmotion.puzzled]),
  angry([SubEmotion.sorrow]),
  peace([SubEmotion.calm]),
  confused([SubEmotion.relaxed]);

  final List<SubEmotion> subEmotions;

  const MainEmotion(this.subEmotions);
}

enum SubEmotion {
  lonely,
  depressed,
  sorrow,
  calm,
  relaxed,
  disoriented,
  puzzled
}

class Emotion {
  MainEmotion mainEmotion; // 메인감정
  String imageUrl; // 캐릭터 이미지 경로
  String gridImageUrl;
  Color emotionColor; // 캐릭터와 맞는 색상
  SubEmotion? subEmotion;
  // List<String> subEmotion; // 변화되고 싶은 감정

  Emotion({
    required this.mainEmotion,
    required this.imageUrl,
    required this.gridImageUrl,
    required this.emotionColor,
    this.subEmotion,
  });
}

List<Emotion> emotions = [
  /// 기쁨이
  Emotion(
    mainEmotion: MainEmotion.joy,
    imageUrl: 'assets/images/icon/icon_joy_y.png',
    gridImageUrl: 'assets/images/icon/square_joy.png',
    emotionColor: mJoyColor,
  ),

  /// 슬픔이
  Emotion(
    mainEmotion: MainEmotion.sad,
    imageUrl: 'assets/images/icon/icon_sadness.png',
    gridImageUrl: 'assets/images/icon/square_sad.png',
    emotionColor: mSadColor, // 파란색
  ),

  /// 짜증이
  Emotion(
    mainEmotion: MainEmotion.angry,
    imageUrl: 'assets/images/icon/icon_angry.png',
    gridImageUrl: 'assets/images/icon/square_angry.png',
    emotionColor: mAngryColor, // 빨간색
  ),

  /// 편안이
  Emotion(
    mainEmotion: MainEmotion.peace,
    imageUrl: 'assets/images/icon/icon_peaceful.png',
    gridImageUrl: 'assets/images/icon/square_peace.png',
    emotionColor: mPeacefulColor, // 연두색
  ),

  /// 혼란이
  Emotion(
    mainEmotion: MainEmotion.confused,
    imageUrl: 'assets/images/icon/icon_confuse.png',
    gridImageUrl: 'assets/images/icon/square_confuse.png',
    emotionColor: mConfusedColor, // 보라색
// subEmotion: MainEmotion.confused.subEmotions[0] 사용 예시
  ),
];
