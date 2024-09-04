import 'package:atempo_app/components/custom_button.dart';
import 'package:atempo_app/components/toast.dart';
import 'package:atempo_app/constants/constants.dart';
import 'package:flutter/material.dart';

/// TODO :  감정선택시 텍스트 필드의 값 바뀌기 > 상수에 'emotionText'사용할것.

class ChoiceEmotionScreen extends StatelessWidget {
  const ChoiceEmotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 80,
              ),
              Text(
                "오늘 나의 기분은 어떤가요?",
                style: TextStyle(
                  color: mFontDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              // 아이콘
              Container(
                // color: Colors.deepOrange,
                width: double.infinity,
                height: 400,
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: Stack(
                  children: [
                    Positioned(
                      right: 51,
                      top: 64,
                      child: GestureDetector(
                        onTap: () {
                          flutterToast("버튼누름!");
                        },
                        child: Image.asset(
                          'assets/images/icon_sad.png',
                          width: 120,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 23,
                      top: 197,
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/icon_joy.png',
                          width: 120,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 147,
                      bottom: 15,
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/icon_peace.png',
                          width: 120,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 65,
                      top: 55,
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/icon_angry.png',
                          width: 120,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 183,
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/icon_confusion.png',
                          width: 120,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "행복해요",
                style: TextStyle(
                  color: mFontDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                height: 30,
              ),
              CustomButton(
                  buttonText: "확인",
                  onPressed: () {
                    flutterToast("확인 버튼 누름");
                  }),
              SizedBox(
                height: 20,
              ),
              Text(
                "선택하지않고 넘어갈래요.",
                style: TextStyle(color: mDisabledColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
