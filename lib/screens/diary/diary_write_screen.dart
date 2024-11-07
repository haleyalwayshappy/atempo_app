import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/screens/diary/widget/choose_sub_text.dart';
import 'package:atempo_app/screens/diary/widget/content_widget.dart';
import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/widgets/custom_button.dart';
import 'package:atempo_app/screens/widgets/emotion_popup_widget.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:flutter/material.dart';

class DiaryWriteScreen extends StatefulWidget {
  const DiaryWriteScreen({
    super.key,
  });

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
  DetailEmotion? selectedSubEmotion;

  // DateTime! selectedDate; // 선택된 날짜 저장

  @override
  void initState() {
    super.initState();

    // 위젯들이 만들어 진 후에
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: ChooseSubText(),
            );
          });
    });
    // selectedDate = widget.selectedDate; // 생성자에서 받은 날짜로 초기화
  }

  // 날짜가 선택될 때 호출되는 메서드
  // void _onDateSelected(DateTime date) {
  //   setState(() {
  //     // selectedDate = date;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: '오늘 하루를 작성해주세요',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // 날짜 선택 위젯

              EmotionPopupWidget(),
              SizedBox(height: 20),
              GestureDetector(
                child: Text("세부감정선택"),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: ChooseSubText(),
                        );
                      });
                },
              ),
              // ChooseSubText(),
              // SizedBox(height: 20), // 간격 추가
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
              CustomButton(
                buttonText: "저장",
                onPressed: () {
                  customToastMsg("저장버튼 눌러따");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
