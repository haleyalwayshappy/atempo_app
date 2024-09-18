import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:flutter/material.dart';

class DiaryGridWidget extends StatelessWidget {
  const DiaryGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 5,
        children: List.generate(dummyDiaryData.length, (index) {
          var imagePath;
          switch (dummyDiaryData[index].mainEmotion) {
            case Emotion.joy:
              imagePath = emotions[0].imageUrl;
              break; // break 추가
            case Emotion.sad:
              imagePath = emotions[1].imageUrl;
              break; // break 추가
            case Emotion.anger:
              imagePath = emotions[2].imageUrl;
              break; // break 추가
            case Emotion.peace:
              imagePath = emotions[3].imageUrl;
              break; // break 추가
            case Emotion.confused:
              imagePath = emotions[4].imageUrl;
              break; // break 추가
          }

          return Image.asset(imagePath); // 이미지 반환
        }),
      ),
    );
  }
}
