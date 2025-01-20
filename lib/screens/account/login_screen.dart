import 'package:atempo_app/service/account/account_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:atempo_app/screens/widgets/proceed_without_actionbutton.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:form_model/form_model.dart';

import '../../jh_exception_handler.dart';

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
  bool _obscureText = true; // 비밀번호 가리기 상태

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
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
                        padding: EdgeInsets.only(
                            bottom: 60), //todo: padding 다른 것으로 대체하는게 좋겠음
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
                            TextFormField(
                              controller: _emailController,
                              validator: accountService.validateEmail,
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
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _obscureText, // 비밀번호 숨김 여부
                              decoration: InputDecoration(
                                labelText: "비밀번호",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.key),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      print("눈 가리고 아웅");
                                      _obscureText =
                                          !_obscureText; // 가리기/보이기 전환
                                    });
                                  },
                                ),
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
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          //todo: Form 추가후 validation 추가, onSave
                          try {
                            await accountService.loginWithEmailPassword(
                                email, password, context);
                          } catch (e) {
                            print('로그인 실패: ${e.toString()}');
                            // SnackBar를 실행하기 전에 ScaffoldMessenger의 context를 올바르게 가져옵니다.
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '로그인에 실패했습니다.\n아이디 또는 비밀번호를 확인해 주세요.'),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /* 애플 로그인 */
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/button/apple_login.png',
                              ),
                              onTap: () {
                                //try/catch 등을 이용하여 error처리
                                accountService.signInWithApple(context);
                              },
                            ),
                            SizedBox(width: 40),
                            // 카카오 로그인 버튼
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/button/kakao_login.png',
                              ),
                              onTap: () {
                                /* 카카오 로그인 */
                                accountService.signInWithKakao(context);
                              },
                            ),
                            SizedBox(width: 40),
                            // 구글 로그인 버튼
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/button/google_login.png',
                              ),
                              onTap: () async {
                                /* 구글 로그인 */
                                try {
                                  await accountService.signInWithGoogle();
                                  context.go('/home');
                                } on FirebaseAuthException catch (e) {
                                } on AuthPasswordException catch (e) {
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('구글 로그인 실패: $e')),
                                  );
                                }
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
                                print("계정찾기");
                                //TODO : 계정찾기 창 만들기
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
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
