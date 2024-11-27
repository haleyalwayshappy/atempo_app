import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:flutter/material.dart';
import 'package:atempo_app/screens/diary/widget/card_widget.dart';

String getMainEmotionImagePath(MainEmotion mainEmotion) {
  final emotion = mainEmotions.firstWhere(
    (e) => e.mainEmotion == mainEmotion,
    orElse: () => mainEmotions.first,
  );
  return emotion.imageUrl;
}

class DiaryListWidget extends StatelessWidget {
  final List<Diary> diaries; // 데이터를 부모에서 전달받음

  const DiaryListWidget({super.key, required this.diaries});

  @override
  Widget build(BuildContext context) {
    if (diaries.isEmpty) {
      return Center(
        child: Text("등록된 일기가 없습니다. 일기를 작성해주세요."),
      );
    }

    return ListView.builder(
      itemCount: diaries.length,
      itemBuilder: (context, index) {
        final diary = diaries[index];
        final imagePath = getMainEmotionImagePath(diary.mainEmotion);
        var date = diary.dateTime;
        var diaryId = diary.diaryId;

        return CustomCardWidget(
          dateTime: date,
          imagePath: imagePath,
          diaryId: diaryId,
        );
      },
    );
  }
}
