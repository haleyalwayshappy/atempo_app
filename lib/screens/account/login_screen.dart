import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:atempo_app/screens/widgets/proceed_without_actionbutton.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:form_model/form_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

// 로그인 인증 함수
  Future<void> _loginWithEmailPassword() async {
    try {
      print(_emailController.text);
      print(_passwordController.text);
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // 인증 메일 클릭 여부
      bool isVerified = userCredential.user!.emailVerified;
      print("isVerified  : $isVerified");
      if (!isVerified) {
        // await userCredential.user!.sendEmailVerification();
        await _auth.signOut();
        customToastMsg("인증이 완료되지 않았습니다.이메일 인증을 해주세요.");
      } else {
        // 로그인 성공 시 홈 화면으로 이동
        if (userCredential.user != null) {
          context.go('/home');
        }
      }
    } catch (e) {
      // 로그인 실패 시 에러 메시지 표시
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('로그인 실패: ${e.toString()}'),
        ),
      );
    }
  }

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
                      // 로그인 버튼
                      GestureDetector(
                        child: Image.asset(
                          'assets/images/button/email_login_btn.png',
                          width: double.infinity,
                          height: 60,
                        ),
                        onTap: () async {
                          // customToastMsg("이메일 로그인 버튼 눌렀땅!");
                          await _loginWithEmailPassword();

                          //TODO : 이메일값이랑 비밀번호 값 담아서 파이어베이스에서 로그인 연동
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/button/naver_login.png',
                              ),
                              onTap: () {
                                //TODO : 네이버 로그인
                              },
                            ),
                            SizedBox(width: 40),
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/button/kakao_login.png',
                              ),
                              onTap: () {
                                //TODO : 카카오 로그인
                              },
                            ),
                            SizedBox(width: 40),
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/button/google_login.png',
                              ),
                              onTap: () {
                                // TODO : 구글 로그인
                                signInWithGoogle();
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

Future<UserCredential> signInWithGoogle() async {
// void signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
