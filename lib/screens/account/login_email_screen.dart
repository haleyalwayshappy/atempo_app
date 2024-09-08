import 'package:flutter/material.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double widthRatio = deviceWidth / 375;
    double heightRatio = deviceHeight / 812;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 70,
              ),
              Image.asset(
                'assets/images/logo_atempo.png',
                width: 300,
              ),
              Container(
                height: 90,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("이메일"),
                  // 로그인 양식 찾기
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("hongniest",),
                      Text("@"),
                      Text("gmail.com"),
                    ],
                  ),
                  Text("패스워드"),
                  Text("********"),
                ],
              ),
              IconButton(
                padding: EdgeInsets.symmetric(vertical: 8),
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
