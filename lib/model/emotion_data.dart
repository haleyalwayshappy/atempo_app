// TODO Enum Class로 변경해야한다.

import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

enum Emotion {
  joy,
  sad,
  anger,
  peace,
  confused,
}

class EmotionData {
  Emotion mainEmotion;
  String imageUrl;
  Color emotionColor;
  // List<String> subEmotion;
  List<String>? musicUrl;

  EmotionData(
      {required this.mainEmotion,
      required this.imageUrl,
      required this.emotionColor,
      this.musicUrl});
}

List<EmotionData> emotions = [
  EmotionData(
    mainEmotion: Emotion.joy,
    imageUrl: 'assets/images/icon/icon_joy_y.png', // 노란색
    emotionColor: mJoyColor,
  ),
  EmotionData(
    mainEmotion: Emotion.sad,
    emotionColor: mSadColor, // 파란색
    imageUrl: 'assets/images/icon/icon_sadness.png',
  ),
  EmotionData(
    mainEmotion: Emotion.anger,
    emotionColor: mAngryColor, // 빨간색
    imageUrl: 'assets/images/icon/icon_angry.png',
  ),
  EmotionData(
    mainEmotion: Emotion.peace,
    emotionColor: mPeacefulColor, // 연두색
    imageUrl: 'assets/images/icon/icon_peaceful.png',
  ),
  EmotionData(
    mainEmotion: Emotion.confused,
    emotionColor: mConfusedColor, // 보라색
    imageUrl: 'assets/images/icon/icon_confuse.png',
  ),
];
