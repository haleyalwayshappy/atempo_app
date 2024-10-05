import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 일기 내용(아이콘 - 날짜) 보여주는 리스트 뷰
class DiaryListWidget extends StatefulWidget {
  const DiaryListWidget({super.key});

  @override
  State<DiaryListWidget> createState() => _DiaryListWidgetState();
}

class _DiaryListWidgetState extends State<DiaryListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dummyDiaryData.length,
        itemBuilder: (context, index) {
          var imagePath;
          switch (dummyDiaryData[index].mainEmotion) {
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
          var date = dummyDiaryData[index].dateTime;
          return CustomCardWidget(
            dateTime: date,
            imagePath: imagePath,
            index: index,
          );
        },
      ),
    );
  }
}
