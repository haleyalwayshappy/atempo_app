import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/screens/diary/widget/content_widget.dart';
import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/widgets/emotion_popup_widget.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class DiaryReadScreen extends StatelessWidget {
  final String diaryId; // diaryId 사용

  const DiaryReadScreen({super.key, required this.diaryId});

  @override
  Widget build(BuildContext context) {
    Diary? selectedDiary;

    // try-catch를 사용하여 다이어리 찾기
    try {
      selectedDiary = dummyDiaryData.firstWhere(
        (diary) => diary.diaryId == diaryId,
      );
    } catch (e) {
      selectedDiary = null;
    }

    if (selectedDiary == null) {
      return Scaffold(
        appBar: CustomAppBar(
          titleText: "일기 없음",
        ),
        body: Center(child: Text("선택한 일기를 찾을 수 없습니다.")),
      );
    }

    DateTime dateTime = selectedDiary.dateTime;
    String dateFormatted =
        "${dateTime.year}년 ${dateTime.month.toString().padLeft(2, '0')}월 ${dateTime.day.toString().padLeft(2, '0')}일";

    return Scaffold(
      appBar: CustomAppBar(
        titleText: dateFormatted,
        backLocation: '/home',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(outlinedDouble),
          child: Column(
            children: [
              EmotionPopupWidget(),
              SizedBox(height: 20), // 간격 추가
              Column(
                children: [
                  ContentWidget(
                    labelText: "Q1.당신의 하루는 어땠나요?",
                    hintText:
                        "${selectedDiary.content1?.isEmpty ?? true ? "내용을 입력해주세요." : selectedDiary.content1}",
                  ),
                  SizedBox(height: 16), // 간격 추가
                  ContentWidget(
                    labelText: "Q2.어떤것이 당신의 기분을 좌우했나요?",
                    hintText:
                        "${selectedDiary.content2?.isEmpty ?? true ? "내용을 입력해주세요." : selectedDiary.content2}",
                  ),
                  SizedBox(height: 16), // 간격 추가
                  ContentWidget(
                    labelText: "Q3.지속되는 감정을 변화시키기 위해 어떤일을 했나요?",
                    hintText:
                        "${selectedDiary.content3?.isEmpty ?? true ? "내용을 입력해주세요." : selectedDiary.content3}",
                  ),
                  SizedBox(height: 16), // 간격 추가
                  ContentWidget(
                    labelText: "Q4.1년전 나는 오늘 생긴일에 대해 어떻게 대처했을 것 같나요?",
                    hintText:
                        "${selectedDiary.content4?.isEmpty ?? true ? "내용을 입력해주세요." : selectedDiary.content4}",
                  ),
                  SizedBox(height: 16), // 간격 추가
                  ContentWidget(
                    labelText: "Q5.1년후 나는 오늘 생긴일에 대해 어떻게 대처할것 같나요?",
                    hintText:
                        "${selectedDiary.content5?.isEmpty ?? true ? "내용을 입력해주세요." : selectedDiary.content5}",
                  ),
                  SizedBox(height: 16),
                ],
              ), // 간격 추가
            ],
          ),
        ),
      ),
    );
  }
}
