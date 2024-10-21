import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/screens/diary/widget/content_widget.dart';
import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/widgets/custom_button.dart';
import 'package:atempo_app/screens/widgets/emotion_popup_widget.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class DiaryWriteScreen extends StatefulWidget {
  DiaryWriteScreen({super.key});

  @override
  State<DiaryWriteScreen> createState() => _DiaryWriteScreenState();
}

class _DiaryWriteScreenState extends State<DiaryWriteScreen> {
  String content1 = "";
  String content2 = "";
  String content3 = "";
  String content4 = "";
  String content5 = "";

  MainEmotion? selectedMainEmotion;
  SubEmotion? selectedSubEmotion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: '오늘 하루를 작성해주세요',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(outlinedDouble),
          child: Column(
            children: [
              EmotionPopupWidget(),
              // Text(dateTime),
              SizedBox(height: 20), // 간격 추가
              Column(
                children: [
                  ContentWidget(
                      labelText: "Q1.당신의 하루는 어땠나요?",
                      hintText: "당신의 마음을 표현해주세요."),
                  SizedBox(height: 16), // 간격 추가
                  ContentWidget(
                      labelText: "Q2.어떤것이 당신의 기분을 좌우했나요?",
                      hintText: "당신의 마음을 표현해주세요."),
                  SizedBox(height: 16), // 간격 추가
                  ContentWidget(
                      labelText: "Q3.지속되는 감정을 변화시키기 위해 어떤일을 했나요?",
                      hintText: "당신의 마음을 표현해주세요."),
                  SizedBox(height: 16), // 간격 추가
                  ContentWidget(
                      labelText: "Q4.1년전 나는 오늘 생긴일에 대해 어떻게 대처했을 것 같나요?",
                      hintText: "당신의 마음을 표현해주세요."),
                  SizedBox(height: 16), // 간격 추가
                  ContentWidget(
                      labelText: "Q5.1년후 나는 오늘 생긴일에 대해 어떻게 대처할것 같나요?",
                      hintText: "당신의 마음을 표현해주세요."),
                  SizedBox(height: 16),
                ],
              ),
              CustomButton(
                  buttonText: "저장",
                  onPressed: () {
                    customToastMsg("저장버튼 눌러따");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
