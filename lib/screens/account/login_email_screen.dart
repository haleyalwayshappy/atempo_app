import 'package:atempo_app/screens/widgets/textfield_with_title.dart';
import 'package:flutter/material.dart';

/// 이메일 로그인 화면
class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset(
                'assets/images/logo_atempo.png',
                width: 300,
              ),
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36, right: 36, bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFieldWithTitle(
                      labelText: '이메일',
                      hintText: "이메일을 입력해주세요.",
                    ),
                    TextFieldWithTitle(
                      labelText: '이메일',
                      hintText: "이메일을 입력해주세요.",
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFieldWithTitle(
                        labelText: '비밀번호', hintText: "비밀번호를 입력해주세요."),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/button/email_login_btn.png',
                  width: 240,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



