// TODO Enum Class로 변경해야한다.

import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

enum EmotionType {
  joy,
  sad,
  anger,
  peace,
  confused,
}

class Emotion {
  EmotionType mainEmotion; // 메인감정
  String imageUrl; // 캐릭터 이미지 경로
  Color emotionColor; // 캐릭터와 맞는 색상
  // List<String> subEmotion; // 변화되고 싶은 감정
  List<String>? musicUrl; // 음악 url

  Emotion({
    required this.mainEmotion,
    required this.imageUrl,
    required this.emotionColor,
    this.musicUrl,
  });
}

List<Emotion> emotions = [
  /// 기쁨이
  Emotion(
    mainEmotion: EmotionType.joy,
    imageUrl: 'assets/images/icon/icon_joy_y.png',
    emotionColor: mJoyColor,
  ),

  /// 슬픔이
  Emotion(
    mainEmotion: EmotionType.sad,
    emotionColor: mSadColor, // 파란색
    imageUrl: 'assets/images/icon/icon_sadness.png',
  ),

  /// 짜증이
  Emotion(
    mainEmotion: EmotionType.anger,
    emotionColor: mAngryColor, // 빨간색
    imageUrl: 'assets/images/icon/icon_angry.png',
  ),

  /// 편안이
  Emotion(
    mainEmotion: EmotionType.peace,
    emotionColor: mPeacefulColor, // 연두색
    imageUrl: 'assets/images/icon/icon_peaceful.png',
  ),

  /// 혼란이
  Emotion(
    mainEmotion: EmotionType.confused,
    emotionColor: mConfusedColor, // 보라색
    imageUrl: 'assets/images/icon/icon_confuse.png',
  ),
];
