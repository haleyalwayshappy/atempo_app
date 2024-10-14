import 'package:atempo_app/screens/widgets/custom_button.dart';
import 'package:atempo_app/screens/widgets/proceed_without_actionbutton.dart';
import 'package:atempo_app/screens/widgets/textfield_with_title.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  "어템포의 가족이 되어주세요",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Santteut',
                    color: mPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(outlinedDouble),
                child: Stack(
                  clipBehavior: Clip.none, // 겹친 부분이 잘리지 않도록 설정
                  children: [
                    // 첫 번째 컨테이너: 배경 이미지
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/emotions.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    // 두 번째 컨테이너: 회원가입 폼
                    Positioned(
                      top: 96, // 첫 번째 컨테이너 위로 올라오도록 설정
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white, // 배경색
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: mPrimaryColor),
                        ),
                        child: Column(
                          children: [
                            // 이름 입력 필드
                            TextFieldWithTitle(
                              labelText: "이름",
                              hintText: "홍길동",
                            ),
                            SizedBox(height: 30),

                            // 이메일 입력 필드
                            TextFieldWithTitle(
                              labelText: "이메일",
                              hintText: "hongniest@gmail.com",
                            ),
                            SizedBox(height: 30),

                            // 비밀번호 입력 필드
                            TextFieldWithTitle(
                              labelText: "비밀번호",
                              hintText: "asdf1234!!",
                            ),
                            SizedBox(height: 30),

                            // 비밀번호 확인 필드
                            TextFieldWithTitle(
                              labelText: "비밀번호 확인",
                              hintText: "asdf1234!!",
                            ),
                            SizedBox(height: 20),

                            // 회원가입 버튼 (모든 필드가 입력된 경우에만 활성화)
                            CustomButton(
                              buttonText: "회원가입 하기",
                              onPressed: () {},
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 480), // 두 번째 컨테이너 아래에 여백 추가

              // "다음에 가입할래요" 버튼
              ProceedWithoutActionButton(
                text: "다음에 가입할래요",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
