import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/widgets/custom_button.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>(); // 폼 키로 유효성 검사를 처리
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // TextEditingControllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _emailError; // 이메일 중복 에러 메세지 변수

  // 회원가입 함수
  Future<void> _signUpWithEmailPassword() async {
    setState(() {
      _emailError = null; // 이메일 에러 초기화
    });

    if (_formKey.currentState!.validate()) {
      try {
        // Firebase에 회원가입 요청
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // 인증 메일 보내기
        await userCredential.user!.sendEmailVerification();

        // uid 불러오기
        String uid = userCredential.user!.uid;

        print(uid);
        print(_emailController.text);
        print(_nameController.text);

        // uid를 문서 ID로 설정 후 파이어스토어에 저장
        await _firestore.collection("users").doc(uid).set({
          "uid": uid,
          "email": _emailController.text,
          "name": _nameController.text,
          "profileImage": null,
          "diaryCount": 0,
        });

        Fluttertoast.showToast(
            msg: "회원가입 성공! 인증메일을 확인해주세요.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 10,
            backgroundColor: Colors.black38,
            textColor: Colors.white,
            fontSize: 16.0);

        _auth.signOut(); // 회원가입과 동시에 로그인이 되기 때문에 로그아웃 (메일 인증 전)
        //TODO : toast 메세지로 인증받아라 > o
        //TODO : 자동 로그인되어있으니 로그아웃 처리 해야함 > o
        //TODO : 로그인에 파이어베이스 벨리데이션 로직 해야함 > o
        context.go('/login');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          setState(() {
            _emailError = "이미 사용 중인 이메일입니다.";
          });
        } else {
          customToastMsg(e.message ?? "회원가입 실패");
        }
      }
    }
  }

  // 이름 유효성 검사 함수
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return '이름을 입력해주세요.';
    }
    final nameRegex = RegExp(r'^[a-zA-Z가-힣\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return '이름은 특수 문자나 숫자를 포함할 수 없습니다.';
    }
    return null;
  }

  // 비밀번호 유효성 검사 함수
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    final passwordRegex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return '비밀번호는 영어, 숫자, 특수 문자를 포함하고 8자리 이상이어야 합니다.';
    }
    return null;
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
                              border:
                                  Border.all(width: 2, color: mPrimaryColor),
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
                                  validator: _validateName, // 이름 유효성 검사 적용
                                ),
                                SizedBox(height: 30),
                                // 이메일 입력 필드
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: "이메일",
                                    hintText: "이메일을 입력하세요",
                                    errorText: _emailError,
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                  validator: (value) {
                                    if (value == null || !value.contains('@')) {
                                      return '유효한 이메일을 입력해주세요.';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 30),
                                // 비밀번호 입력 필드
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "패스워드",
                                    hintText: "패스워드를 입력해주세요.",
                                    prefixIcon: Icon(Icons.key),
                                  ),
                                  validator:
                                      _validatePassword, // 비밀번호 유효성 검사 적용
                                ),
                                SizedBox(height: 20),
                                // 비밀번호 확인 필드
                                TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "패스워드 확인",
                                    hintText: "패스워드를 한번 더 입력해주세요.",
                                    prefixIcon: Icon(Icons.key),
                                  ),
                                  validator: (value) {
                                    if (value != _passwordController.text) {
                                      return '패스워드가 일치하지 않습니다.';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20),
                                // 회원가입 버튼
                                CustomButton(
                                  buttonText: "회원가입 하기",
                                  onPressed: _signUpWithEmailPassword,
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
