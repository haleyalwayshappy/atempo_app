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

class DiaryWriteScreen3 extends StatelessWidget {
  final DiaryController diaryController = Get.put(DiaryController());

  DiaryWriteScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "하루 일기"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.79,
                child: Stack(
                  children: [
                    // 배경 이미지
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/main_emotion/icon_angry.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    // 화면
                    Positioned(
                      top: 77,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: mBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: mPrimaryColor),
                        ),
                        child: Column(
                          children: [
                            // 날짜
                            // 날짜 선택기
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
                                                backgroundColor:
                                                    mBackgroundColor,
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                initialDateTime: diaryController
                                                    .dateTime.value,
                                                maximumDate: DateTime.now(),
                                                onDateTimeChanged: (value) {
                                                  tempDate =
                                                      value; // 임시 변수에 선택한 날짜 저장
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
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => EmotionGridPopup(),
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              width: 4, color: mPrimaryColor)),
                                      padding: EdgeInsets.all(8),
                                      child: Image.asset(
                                        'assets/images/detailed_emotion/pumped.png',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              width: 4, color: mPrimaryColor)),
                                      padding: EdgeInsets.all(8),
                                      child: Image.asset(
                                        'assets/images/detailed_emotion/calm.png',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              width: 4, color: mPrimaryColor)),
                                      padding: EdgeInsets.all(8),
                                      child: Image.asset(
                                        'assets/images/detailed_emotion/creepy.png',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              width: 4, color: mPrimaryColor)),
                                      padding: EdgeInsets.all(8),
                                      child: Image.asset(
                                        'assets/images/detailed_emotion/proud.png',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // 질문
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
                                    labelText:
                                        "Q4.1년전 나는 오늘 생긴일에 대해 어떻게 대처했을 것 같나요?",
                                    hintText: "당신의 마음을 표현해주세요."),
                                SizedBox(height: 12), // 간격 추가
                                ContentWidget(
                                    labelText:
                                        "Q5.1년후 나는 오늘 생긴일에 대해 어떻게 대처할것 같나요?",
                                    hintText: "당신의 마음을 표현해주세요."),
                                SizedBox(height: 12),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        // color: mPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 70,
                child: FilledButton(
                  onPressed: () {
                    customToastMsg("취소 버튼");
                  },
                  child: Text("취소"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 70,
                child: FilledButton(
                  onPressed: () {
                    customToastMsg("확인버튼");
                  },
                  child: Text("확인"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                // 날짜
                // 날짜 선택기
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
                    final selectedDate = diaryController.dateTime.value; // 날짜
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

                // 메인 감정
                GestureDetector(
                  onTap: () {
                    MainEmotion tempEmotion = diaryController.mainEmotion.value;

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
                  child: ChoiceChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: mPrimaryColor,
                        width: 1.0,
                      ),
                    ),
                    label: Text(
                      "해피!",
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                    // selected: selectedPet == pet,
                    selectedColor: mBackgroundColor,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.red,
                    ),
                    selected: true,
                  ),
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
            ),*/

class EmotionGridPopup extends StatelessWidget {
  final List<String> imageUrls =
      detailEmotionInfo.values.map((emotion) => emotion.imageUrl).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 한 줄에 4개씩 배치
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.asset(
            imageUrls[index],
            width: 100,
            // fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
