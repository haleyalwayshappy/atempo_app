import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:flutter/material.dart';

/// 다이어리 아이콘을 그리드로 보여주는 위젯
class DiaryGridWidget extends StatelessWidget {
  const DiaryGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 10, // 간격
        mainAxisSpacing: 10, // 간격
        crossAxisCount: 6, // 한줄에 5개 (여기서 갯수 조정 가능)
        children: List.generate(dummyDiaryData.length, (index) {
          var imagePath; // 이미지 경로
          /// 다이어리 데이터감정이 무엇인지를 판단하여 맞는 아이콘을 화면에 보여준다.
          switch (dummyDiaryData[index].mainEmotion) {
            case EmotionType.joy:
              imagePath = emotions[0].imageUrl;
              break; // break 추가
            case EmotionType.sad:
              imagePath = emotions[1].imageUrl;
              break; // break 추가
            case EmotionType.anger:
              imagePath = emotions[2].imageUrl;
              break; // break 추가
            case EmotionType.peace:
              imagePath = emotions[3].imageUrl;
              break; // break 추가
            case EmotionType.confused:
              imagePath = emotions[4].imageUrl;
              break; // break 추가
          }

          return Image.asset(imagePath); // 이미지 반환
        }),
      ),
    );
  }
}
