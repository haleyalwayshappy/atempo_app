import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/screens/diary/widget/choose_sub_text.dart';
import 'package:atempo_app/screens/diary/widget/content_widget.dart';
import 'package:atempo_app/screens/widgets/choose_main_emotion_icons.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/service/diary/diary_service.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

class DiaryWriteScreen4 extends StatelessWidget {
  final DiaryController diaryController = Get.put(DiaryController());

  DiaryWriteScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    // 일기 타입이 다이어리타입 =  0 ; 5가지 질문 이라서 값 할당해줘야함
    int diaryType = 0;
    diaryController.setDiaryType(diaryType);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: mBackgroundColor,
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: GestureDetector(
            onTap: () {
              DateTime tempDate = diaryController.dateTime.value; // 임시 날짜 저장
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SafeArea(
                    child: Container(
                      color: mBackgroundColor,
                      height: 350,
                      child: Column(
                        children: [
                          Expanded(
                            child: CupertinoDatePicker(
                              backgroundColor: mBackgroundColor,
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: diaryController.dateTime.value,
                              maximumDate: DateTime.now(),
                              onDateTimeChanged: (value) {
                                tempDate = value; // 임시 변수에 선택한 날짜 저장
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              diaryController
                                  .updateDateTime(tempDate); // 최종 선택된 날짜 업데이트
                              Navigator.pop(context); // 모달 닫기
                            },
                            child: Text("확인"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Obx(() {
              final selectedDate = diaryController.dateTime.value; // 날짜
              final formattedDate =
                  "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일"; //화면에 보여질 데이터
              return Text(
                formattedDate, // 선택된 날짜가 들어와야함
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Santteut",
                  fontWeight: FontWeight.normal,
                  color: mPrimaryColor,
                ),
              );
            }),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                context.go('/my_page');
                // index = 0;
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: mFontDarkColor),
            onPressed: () {
              context.go('/diary');
            },
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 왼쪽에 고정된 GestureDetector
                    GestureDetector(
                      onTap: () {
                        MainEmotion tempEmotion =
                            diaryController.mainEmotion.value;
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              children: [
                                Expanded(
                                  child: ChooseMainEmotionIcons(
                                    onIconTap: (MainEmotion emotion) {
                                      diaryController.updateMainEmotion(
                                          emotion); // 즉시 메인 감정 업데이트
                                      customToastMsg("${emotion} 버튼누름!");
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context); // 모달 닫기
                                  },
                                  child: Text("확인"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Obx(() {
                        final selectedMainEmotion =
                            diaryController.mainEmotion.value;
                        final imageUrl = diaryController
                            .getMainEmotionImageUrl(selectedMainEmotion);
                        return Image.asset(
                          width: 120,
                          '$imageUrl',
                        );
                      }),
                    ),

                    // 오른쪽에 고정된 Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 선택된 감정 표시 영역
                          SizedBox(height: 12),
                          Obx(() {
                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: diaryController.subEmotions
                                  .map((detailEmotion) {
                                // detailEmotionInfo 맵을 사용하여 Emotion 객체를 가져옴
                                final emotion =
                                    detailEmotionInfo[detailEmotion];
                                if (emotion == null)
                                  return SizedBox.shrink(); // null 체크
                                return Chip(
                                  label: Text(emotion.title),
                                  backgroundColor:
                                      emotion.emotionColor.withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: emotion.emotionColor,
                                      width: 1.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          }),

                          SizedBox(height: 12),
                          // 서브 감정 선택
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return ChooseSubText();
                                },
                              );
                            },
                            child: Chip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: mPrimaryColor,
                                  width: 1.0,
                                ),
                              ),
                              label: Icon(
                                Icons.add,
                                color: mPrimaryColor,
                              ),
                              backgroundColor: mPeacefulColor.withOpacity(0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ContentWidget(
                labelText: "Q1.오늘은 어떤일이 있었나요?",
                hintText: "당신의 마음을 표현해주세요.",
                onChanged: (value) =>
                    diaryController.updateContent(1, value ?? ''),
              ),
              SizedBox(height: 12), // 간격 추가
              ContentWidget(
                labelText: "Q2.그 일이 당신의 기분을 어떻게 만들었나요?",
                hintText: "당신의 마음을 표현해주세요.",
                onChanged: (value) =>
                    diaryController.updateContent(2, value ?? ''),
              ),
              SizedBox(height: 12), // 간격 추가
              ContentWidget(
                labelText: "Q3.그 감정이 당신에게 도움 또는 방해가 되었나요? ",
                hintText: "당신의 마음을 표현해주세요.",
                onChanged: (value) =>
                    diaryController.updateContent(3, value ?? ''),
              ),
              SizedBox(height: 12), // 간격 추가
              ContentWidget(
                labelText: "Q4.1년전 나는 오늘 생긴일에 대해 어떻게 대처했을 것 같나요?",
                hintText: "당신의 마음을 표현해주세요.",
                onChanged: (value) =>
                    diaryController.updateContent(4, value ?? ''),
              ),
              SizedBox(height: 12), // 간격 추가
              ContentWidget(
                labelText: "Q5.1년후 나는 오늘 생긴일에 대해 어떻게 대처할것 같나요?",
                hintText: "당신의 마음을 표현해주세요.",
                onChanged: (value) =>
                    diaryController.updateContent(5, value ?? ''),
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
      // bottomNavigationBar의 저장 버튼
      bottomNavigationBar: Container(
        height: 70,
        color: mPrimaryColor,
        child: GestureDetector(
          onTap: () async {
            Diary diary = diaryController.getDiary();
            print("저장된 일기: $diary");

            bool isSaved = await DiaryService().saveDiaryToFirestore();

            if (isSaved) {
              customToastMsg("일기가 저장되었습니다!");
              context.go('/diary'); // 다이어리 리스트 화면으로 이동
            } else {
              customToastMsg("일기 저장에 실패했습니다. 다시 시도해주세요.");
            }
          },
          child: Center(child: Text("저장")),
        ),
      ),
    );
  }
}
