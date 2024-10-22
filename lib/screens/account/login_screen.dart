import 'package:atempo_app/service/account/account_service.dart';
import 'package:atempo_app/service/account/login_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:atempo_app/screens/widgets/proceed_without_actionbutton.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:form_model/form_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AccountService accountService = AccountService();

  @override
  Widget build(BuildContext context) {
    final emailModel = FormModel<String>(
      validators: [RequiredValidator(), EmailValidator()],
    );

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: constraints.maxHeight > 600
                  ? NeverScrollableScrollPhysics()
                  : BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(bottom: 60),
                        child: Image.asset(
                          'assets/images/logo_atempo.png',
                          height: 80,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: "이메일",
                                hintText: "이메일을 입력하세요",
                                // helperText: "이메일 형식에 맞게 입력하세요",
                                // errorText: null,
                                prefixIcon: Icon(Icons.email),
                                // suffixIcon: Icon(Icons.check),
                                border: OutlineInputBorder(),
                                // contentPadding: EdgeInsets.all(12.0),
                              ),
                              controller: _emailController,
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: _passwordController,
                              onTap: () {},
                              decoration: InputDecoration(
                                labelText: "비밀번호",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.key),
                                // contentPadding: EdgeInsets.all(12.0),
                              ),
                              style: TextStyle(color: mFontDarkColor),
                            ),
                          ],
                        ),
                      ),
                      //이메일 로그인 버튼
                      GestureDetector(
                        child: Image.asset(
                          'assets/images/button/email_login_btn.png',
                          width: double.infinity,
                          height: 60,
                        ),
                        onTap: () async {
                          // customToastMsg("이메일 로그인 버튼 눌렀땅!");
                          String email = _emailController.text;
                          String password = _passwordController.text;

                          accountService.loginWithEmailPassword(
                              email, password, context);

                          //TODO : 이메일값이랑 비밀번호 값 담아서 파이어베이스에서 로그인 연동
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // 네이버  로그인 버튼
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/button/naver_login.png',
                              ),
                              onTap: () {
                                //TODO : 네이버 로그인
                              },
                            ),
                            SizedBox(width: 40),
                            // 카카오 로그인 버튼
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/button/kakao_login.png',
                              ),
                              onTap: () {
                                //TODO : 카카오 로그인
                                accountService.signInWithKakao(context);
                              },
                            ),
                            SizedBox(width: 40),
                            // 구글 로그인 버튼
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/button/google_login.png',
                              ),
                              onTap: () {
                                // TODO : 구글 로그인
                                accountService.signInWithGoogle(context);
                              },
                            ),
                          ],
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
                                style: TextStyle(
                                    fontSize: 16, color: mFontDarkColor),
                              ),
                              onTap: () {
                                context.go('/create_account');
                              },
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
                              onTap: () {
                                //TODO : 계정찾기 창 만들기
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProceedWithoutActionButton(
                        text: "다음에 로그인 할래요",
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
