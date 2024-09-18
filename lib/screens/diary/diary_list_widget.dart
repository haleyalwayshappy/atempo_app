import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/widgets/list_widget.dart';
import 'package:flutter/material.dart';

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
            case Emotion.joy:
              imagePath = emotions[0].imageUrl;
            case Emotion.sad:
              imagePath = emotions[1].imageUrl;
            case Emotion.anger:
              imagePath = emotions[2].imageUrl;
            case Emotion.peace:
              imagePath = emotions[3].imageUrl;
            case Emotion.confused:
              imagePath = emotions[4].imageUrl;
          }
          return ListWidget(
            dateTime: dummyDiaryData[index].dateTime,
            imagePath: imagePath,
          ); // DiaryListWidget을 보여줍니다.
        },
      ),
    );
  }
}
