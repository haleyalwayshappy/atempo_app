import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*ChoiceChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? emotion.emotionColor : mGrey4Color,
                        width: 1.0,
                      ),
                    ),
                    label: Text(
                      emotion.title,
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                    selectedColor: mBackgroundColor,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      chipController.toggleChipSelection(emotion);
                    },
                  );*/
class ChooseSubText extends StatelessWidget {
  final DiaryController diaryController = Get.find<DiaryController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          // 최대 선택 경고 메시지
          Obx(() {
            return diaryController.showMaxSelectionWarning.value
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "감정은 최대 5개까지만 선택할 수 있습니다.",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.red,
                      ),
                    ),
                  )
                : Container();
          }),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: detailEmotionInfo.values.map((emotion) {
              return Obx(() {
                // isSelected는 subEmotions에 emotion.detailEmotion이 포함되었는지 확인
                final isSelected =
                    diaryController.subEmotions.contains(emotion.detailEmotion);

                return ChoiceChip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: isSelected ? emotion.emotionColor : mGrey4Color,
                      width: 1.0,
                    ),
                  ),
                  label: Text(
                    emotion.title,
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: emotion.emotionColor.withOpacity(0.2),
                  selected: isSelected,
                  onSelected: (selected) {
                    // 감정 선택/해제 로직 호출
                    diaryController.toggleChipSelection(emotion);
                  },
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }
}

/*

class EmotionChip extends StatelessWidget {
  final Emotion emotion;

  const EmotionChip({super.key, required this.emotion});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customToastMsg(emotion.context);
      },
      child: Chip(
        // clipBehavior: Clip.antiAlias,
        label: Text(
          emotion.title,
          style: TextStyle(
            color: mFontDarkColor,
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w600,
            fontSize: 12, // 텍스트 크기를 줄여 칩 크기 감소
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: emotion.emotionColor),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
*/
