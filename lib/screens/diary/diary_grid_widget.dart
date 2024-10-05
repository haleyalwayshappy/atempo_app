import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 다이어리 아이콘을 그리드로 보여주는 위젯
class DiaryGridWidget extends StatelessWidget {
  const DiaryGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 10,
          // 간격
          mainAxisSpacing: 10,
          // 간격
          crossAxisCount: 6,
          // 한줄에 5개 (여기서 갯수 조정 가능)
          children: List.generate(dummyDiaryData.length, (index) {
            var diary = dummyDiaryData[index];
            var imagePath; // 감정에 따른 이미지 경로
            switch (diary) {
              case MainEmotion.joy:
                imagePath = emotions[0].imageUrl;
                break; // break 추가
              case MainEmotion.sad:
                imagePath = emotions[1].imageUrl;
                break; // break 추가
              case MainEmotion.anger:
                imagePath = emotions[2].imageUrl;
                break; // break 추가
              case MainEmotion.peace:
                imagePath = emotions[3].imageUrl;
                break; // break 추가
              case MainEmotion.confused:
                imagePath = emotions[4].imageUrl;
                break; // break 추가
            }

            return GestureDetector(
                onTap: () {
                  context.go('/diary/read/${index + 1}');
                },
                child: Image.asset(imagePath)); // 이미지 반환
          }),
        ),
      ),
    );
  }
}
