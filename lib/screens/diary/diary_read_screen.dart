import 'package:atempo_app/screens/diary/diary_write_widget.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/emotion_popup_widget.dart';
import 'package:atempo_app/widgets/textfield_with_title.dart';
import 'package:flutter/material.dart';

class DiaryReadScreen extends StatelessWidget {
  const DiaryReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              EmotionPopupWidget(),
              SizedBox(height: 16), // 간격 추가
              DiaryWriteWidget(
                labelText: "Q1.당신의 하루는 어땠나요?",
                hintText: '답변해주세요',
              ),
              SizedBox(height: 16), // 간격 추가
              DiaryWriteWidget(
                labelText: "Q2.어떤것이 당신의 기분을 좌우했나요?",
                hintText: '답변해주세요',
              ),
              SizedBox(height: 16), // 간격 추가
              DiaryWriteWidget(
                labelText: "Q3.지속되는 감정을 변화시키기 위해 어떤일을 했나요?",
                hintText: '답변해주세요',
              ),
              SizedBox(height: 16), // 간격 추가
              DiaryWriteWidget(
                labelText: "Q4.1년전 나는 오늘 생긴일에 대해 어떻게 대처했을 것 같나요?",
                hintText: '답변해주세요',
              ),
              SizedBox(height: 16), // 간격 추가
              DiaryWriteWidget(
                labelText: "Q5.1년후 나는 오늘 생긴일에 대해 어떻게 대처할것 같나요?",
                hintText: '답변해주세요',
              ),
              SizedBox(height: 16), // 간격 추가
            ],
          ),
        ),
      ),
    );
  }
}
