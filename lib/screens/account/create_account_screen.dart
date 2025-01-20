import 'package:atempo_app/controller/account/nickname_generator.dart';
import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/widgets/custom_button.dart';
import 'package:atempo_app/service/account/account_service.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>(); // 폼 키로 유효성 검사를 처리
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureTextMain = true; // 비밀번호 가리기 상태
  bool _obscureTextSub = true; // 비밀번호 가리기 상태
  String _randomNickName = "닉네임을 입력해주세요.";
  NicknameGenerator generator = NicknameGenerator();

  AccountService accountService = AccountService();

  // 회원가입 버튼이 눌렸을 때 처리하는 함수
  Future<void> _handleSignUpButton() async {
    // 폼 유효성 검사
    if (_formKey.currentState!.validate()) {
      try {
        // 이메일과 패스워드를 통해 회원가입 처리
        await accountService.signUpWithEmailPassword(
            _emailController.text.trim(),
            _passwordController.text.trim(),
            _nameController.text.trim(),
            _nicknameController.text.trim());

        Fluttertoast.showToast(
            msg: "회원가입 성공! 인증메일을 확인해주세요.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 10,
            backgroundColor: Colors.black38,
            textColor: Colors.white,
            fontSize: 16.0);

        accountService.signOut(context); // 회원가입과 동시에 로그인이 되기 때문에 로그아웃 (메일 인증 전)

        // 회원가입 성공 시 홈 화면으로 이동
        context.go('/login');
      } catch (e) {
        // 회원가입 실패 시 에러 메시지 출력
        Fluttertoast.showToast(
          msg: "회원가입에 실패했습니다: ${e.toString()}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "",
        backLocation: "/login",
        showBackButton: true,
        isMyPage: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: outlinedDouble),
            child: Form(
              key: _formKey, // 폼 키 추가
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "어템포의 가족이 되어주세요",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Santteut',
                      color: mPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.79,
                    child: Stack(
                      children: [
                        // 배경 이미지
                        Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/emotions.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        // 회원가입 폼
                        Positioned(
                          top: 77,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: mBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: mPrimaryColor,
                                // color: Colors.green.withOpacity(0.3),
                              ),
                            ),
                            child: Column(
                              children: [
                                // 이름 입력 필드
                                TextFormField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    labelText: "이름",
                                    hintText: "이름을 입력해주세요.",
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  validator: accountService
                                      .validateName, // 이름 유효성 검사 적용
                                ),
                                SizedBox(height: 12),
                                // 닉네임 입력 필드
                                TextFormField(
                                  controller: _nicknameController,
                                  decoration: InputDecoration(
                                    labelText: "닉네임",
                                    hintText: _randomNickName,
                                    prefixIcon: Icon(Icons.account_box_rounded),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _randomNickName =
                                                generator.generateNickname();
                                            _nicknameController.text =
                                                _randomNickName;
                                          });
                                        },
                                        icon: Icon(Icons.edit)),
                                  ),
                                  validator: accountService.validateNickName,
                                ),
                                SizedBox(height: 12),
                                // 이메일 입력 필드
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: "이메일",
                                    hintText: "이메일을 입력하세요",
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                  validator: accountService.validateEmail,
                                ),
                                SizedBox(height: 12),
                                // 비밀번호 입력 필드
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscureTextMain,
                                  decoration: InputDecoration(
                                    labelText: "패스워드",
                                    hintText: "패스워드를 입력해주세요.",
                                    prefixIcon: Icon(Icons.key),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureTextMain
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          print("눈 가리고 아웅");
                                          _obscureTextMain =
                                              !_obscureTextMain; // 가리기/보이기 전환
                                        });
                                      },
                                    ),
                                  ),
                                  validator: accountService
                                      .validatePassword, // 비밀번호 유효성 검사 적용
                                ),
                                SizedBox(height: 16),
                                // 비밀번호 확인 필드
                                TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: _obscureTextSub,
                                  decoration: InputDecoration(
                                    labelText: "패스워드 확인",
                                    hintText: "패스워드를 한번 더 입력해주세요.",
                                    prefixIcon: Icon(Icons.key),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureTextSub
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          print("눈 가리고 아웅");
                                          _obscureTextSub =
                                              !_obscureTextSub; // 가리기/보이기 전환
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value != _passwordController.text) {
                                      return '패스워드가 일치하지 않습니다.';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 24),
                                // 회원가입 버튼
                                CustomButton(
                                  buttonText: "회원가입 하기",
                                  onPressed: _handleSignUpButton,
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
