import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String? getMainEmotionGridImagePath(MainEmotion mainEmotion) {
  final emotion = mainEmotions.firstWhere(
    (e) => e.mainEmotion == mainEmotion,
    orElse: () => mainEmotions.first,
  );
  return emotion.gridImageUrl;
}

class DiaryGridWidget extends StatelessWidget {
  final List<Diary> diaries; // 데이터를 부모에서 전달받음

  const DiaryGridWidget({super.key, required this.diaries});

  @override
  Widget build(BuildContext context) {
    if (diaries.isEmpty) {
      return Center(child: Text("등록된 일기가 없습니다."));
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 6,
        children: List.generate(diaries.length, (index) {
          final diary = diaries[index];
          final diaryId = diary.diaryId;
          final gridEmotionImageUrl =
              getMainEmotionGridImagePath(diary.mainEmotion);

          return GestureDetector(
            onTap: () {
              context.go('/read/$diaryId');
            },
            child: Image.asset(gridEmotionImageUrl!),
          );
        }),
      ),
    );
  }
}
