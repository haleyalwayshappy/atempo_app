// TODO Enum Class로 변경해야한다.

import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

enum MainEmotion {
  sad([SubEmotion.calm, SubEmotion.depressed, SubEmotion.sorrow]),
  joy([SubEmotion.lonely, SubEmotion.puzzled]),
  anger([SubEmotion.sorrow]),
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
  Color emotionColor; // 캐릭터와 맞는 색상
  SubEmotion? subEmotion;
  // List<String> subEmotion; // 변화되고 싶은 감정

  Emotion({
    required this.mainEmotion,
    this.subEmotion,
    required this.imageUrl,
    required this.emotionColor,
  });
}

List<Emotion> emotions = [
  /// 기쁨이
  Emotion(
    mainEmotion: MainEmotion.joy,
    imageUrl: 'assets/images/icon/icon_joy_y.png',
    emotionColor: mJoyColor,
  ),

  /// 슬픔이
  Emotion(
    mainEmotion: MainEmotion.sad,
    emotionColor: mSadColor, // 파란색
    imageUrl: 'assets/images/icon/icon_sadness.png',
  ),

  /// 짜증이
  Emotion(
    mainEmotion: MainEmotion.anger,
    emotionColor: mAngryColor, // 빨간색
    imageUrl: 'assets/images/icon/icon_angry.png',
  ),

  /// 편안이
  Emotion(
    mainEmotion: MainEmotion.peace,
    emotionColor: mPeacefulColor, // 연두색
    imageUrl: 'assets/images/icon/icon_peaceful.png',
  ),

  /// 혼란이
  Emotion(
    mainEmotion: MainEmotion.confused,
    emotionColor: mConfusedColor, // 보라색
    imageUrl: 'assets/images/icon/icon_confuse.png',
// subEmotion: MainEmotion.confused.subEmotions[0] 사용 예시
  ),
];
