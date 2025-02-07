import 'package:atempo_app/screens/home/widget/animated_angry_Image.dart';
import 'package:atempo_app/screens/home/widget/animated_confused_Image.dart';
import 'package:atempo_app/screens/home/widget/animated_joy_Image.dart';
import 'package:atempo_app/screens/home/widget/animated_peace_Image.dart';
import 'package:atempo_app/screens/home/widget/animated_sad_Image.dart';
import 'package:atempo_app/screens/widgets/custom_button.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              SizedBox(
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
                          customToastMsg("버튼누름!");
                        },
                        child: AnimatedSadImage(
                            image:
                                'assets/images/main_emotion/icon_sadness.png',
                            width: 120),
                      ),
                    ),
                    Positioned(
                      right: 23,
                      top: 197,
                      child: GestureDetector(
                        onTap: () {},
                        child: AnimatedJoyImage(
                          image: 'assets/images/main_emotion/icon_joy_y.png',
                          width: 120,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 147,
                      bottom: 15,
                      child: GestureDetector(
                        onTap: () {},
                        child: AnimatedPeaceImage(
                          image: 'assets/images/main_emotion/icon_peaceful.png',
                          width: 120,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 65,
                      top: 55,
                      child: GestureDetector(
                        onTap: () {},
                        child: AnimatedAngryImage(
                          image: 'assets/images/main_emotion/icon_angry.png',
                          width: 120,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 183,
                      child: GestureDetector(
                        onTap: () {},
                        child: AnimatedConfusedImage(
                          image: 'assets/images/main_emotion/icon_confuse.png',
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
                    customToastMsg("확인 버튼 누름");
                  }),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  // 배경을 투명하게 설정
                  elevation: WidgetStateProperty.all(0), // 그림자 제거 (선택 사항)
                ),
                onPressed: () {
                  customToastMsg("메인으로 가는 버튼");
                  context.go('/home');
                },
                child: Text(
                  "선택하지않고 넘어갈래요",
                  style: TextStyle(
                    color: mGrey3Color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
