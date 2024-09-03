import 'package:atempo_app/components/custom_button.dart';
import 'package:atempo_app/constants/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      body: Center(
        child: Column(
          children: [
            Container(
              height: 80,
            ),
            Image.asset(
              'assets/images/icon_atempo_logo.png',
              width: 300,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: Image.asset('assets/images/kakao_btn.png'),
                ),
                IconButton(
                  // visualDensity: VisualDensity(horizontal: -4),
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: Image.asset('assets/images/apple_btn.png'),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: Image.asset('assets/images/email_btn.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        child: Text(
                          "회원가입",
                          style: TextStyle(
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: mFontColor),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Text(
                      "/",
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        child: Text(
                          "계정찾기",
                          style: TextStyle(fontSize: 16),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
