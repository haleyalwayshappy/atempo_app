import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/screens/diary/widget/choose_sub_text.dart';
import 'package:atempo_app/screens/diary/widget/content_widget.dart';
import 'package:atempo_app/screens/widgets/choose_main_emotion_icons.dart';
import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DiaryWriteScreen2 extends StatelessWidget {
  final DiaryController diaryController = Get.put(DiaryController());

  DiaryWriteScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "하루 일기"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: outlinedDouble),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: mSecondaryColor,
                  border: Border.all(color: mPrimaryColor, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 감정  선택
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
                                      // tempEmotion = emotion; // 임시변수에 감정 저장
                                      customToastMsg("${emotion} 버튼누름!");
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // diaryController.updateMainEmotion(
                                    //     tempEmotion); // 최종 선택된 날짜 업데이트
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
                        print("imageUrl : ${imageUrl}");
                        return Image.asset(
                          width: 80,
                          '$imageUrl',
                        );
                      }),
                    ),
                    // 날짜 선택
                    GestureDetector(
                      onTap: () {
                        DateTime tempDate =
                            diaryController.dateTime.value; // 임시 날짜 저장

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
                                        initialDateTime:
                                            diaryController.dateTime.value,
                                        maximumDate: DateTime.now(),
                                        onDateTimeChanged: (value) {
                                          tempDate = value; // 임시 변수에 선택한 날짜 저장
                                        },
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        diaryController.updateDateTime(
                                            tempDate); // 최종 선택된 날짜 업데이트
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
                        final selectedDate =
                            diaryController.dateTime.value; // 날짜
                        final formattedDate =
                            "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일"; //화면에 보여질 데이터
                        return Text(
                          formattedDate, // 선택된 날짜가 들어와야함
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Santteut",
                            fontWeight: FontWeight.bold,
                            color: mPrimaryColor,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(outlinedDouble),
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.none,
                      width: 2,
                      color: mPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),

                    // 서브 감정 선택
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                        SizedBox(
                          width: 12,
                        ),
                        // 선택된 감정 표시 영열
                        Obx(() {
                          return Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: diaryController.subEmotions
                                .map((detailEmotion) {
                              // detailEmotionInfo 맵을 사용하여 Emotion 객체를 가져옴
                              final emotion = detailEmotionInfo[detailEmotion];
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
                      ],
                    ),
                    Column(
                      children: [
                        ContentWidget(
                            labelText: "Q1.오늘은 어떤일이 있었나요?",
                            hintText: "당신의 마음을 표현해주세요."),
                        SizedBox(height: 12), // 간격 추가
                        ContentWidget(
                            labelText: "Q2.그 일이 당신의 기분을 어떻게 만들었나요?",
                            hintText: "당신의 마음을 표현해주세요."),
                        SizedBox(height: 12), // 간격 추가
                        ContentWidget(
                            labelText: "Q3.그 감정이 당신에게 도움 또는 방해가 되었나요? ",
                            hintText: "당신의 마음을 표현해주세요."),
                        SizedBox(height: 12), // 간격 추가
                        ContentWidget(
                            labelText: "Q4.1년전 나는 오늘 생긴일에 대해 어떻게 대처했을 것 같나요?",
                            hintText: "당신의 마음을 표현해주세요."),
                        SizedBox(height: 12), // 간격 추가
                        ContentWidget(
                            labelText: "Q5.1년후 나는 오늘 생긴일에 대해 어떻게 대처할것 같나요?",
                            hintText: "당신의 마음을 표현해주세요."),
                        SizedBox(height: 12),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: mPrimaryColor,
        child: Container(
            height: 70,
            child: GestureDetector(
              child: Center(child: Text("저장")),
            )),
      ),
    );
  }
}
