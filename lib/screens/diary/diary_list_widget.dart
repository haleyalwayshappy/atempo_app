import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:atempo_app/screens/diary/widget/card_widget.dart';
import 'package:get/get.dart';

class DiaryListWidget extends StatelessWidget {
  final List<Diary> diaries; // 데이터를 부모에서 전달받음
  final DiaryController _controller = Get.find<DiaryController>();
  DiaryListWidget({super.key, required this.diaries});

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
        var isShow = diary.isShow;
        return Dismissible(
          key: ObjectKey(diary.diaryId),
          direction: DismissDirection.endToStart,
          onDismissed: (DismissDirection direction) {
            diary.isShow = false; // 로컬 데이터 수정
            _controller.updateDiary(diary); // Firebase에 업데이트
            _controller.diaryList.refresh(); // RxList 강제 갱신
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('삭제됨')));
          },
          child: CustomCardWidget(
            dateTime: date,
            imagePath: imagePath,
            diaryId: diaryId,
          ),
        );
      },
    );
  }
}

String getMainEmotionImagePath(MainEmotion mainEmotion) {
  final emotion = mainEmotions.firstWhere(
    (e) => e.mainEmotion == mainEmotion,
    orElse: () => mainEmotions.first,
  );
  return emotion.imageUrl;
}
