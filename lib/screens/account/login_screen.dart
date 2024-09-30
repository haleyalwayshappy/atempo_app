import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 최초 로그인 화면 (카카오톡, 애플, 이메일 로그인)
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: mPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // container - heigth값은 위아래 여백을 위해 사용함
              Container(
                height: 150,
              ),
              Image.asset(
                'assets/images/logo_atempo.png',
                width: 300,
              ),
              Container(
                height: 150,
                // color: Colors.amberAccent,
                // padding: EdgeInsets.symmetric(vertical: 200),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    // visualDensity: VisualDensity.compact,
                    onPressed: () {
                      context.go('/home');
                    },
                    icon: Image.asset(
                      'assets/images/button/kakao_login_btn.png',
                      width: 240,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.symmetric(vertical: 8),

                    // visualDensity: VisualDensity(horizontal: -4),
                    // visualDensity: VisualDensity.compact,
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/button/apple_login_btn.png',
                      width: 240,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/button/email_login_btn.png',
                      width: 240,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          child: Text(
                            "회원가입",
                            style:
                                TextStyle(fontSize: 16, color: mFontDarkColor),
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
      ),
    );
  }
}
