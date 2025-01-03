import 'package:atempo_app/controller/account/nickname_generator.dart';
import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/widgets/custom_button.dart';
import 'package:atempo_app/service/account/account_service.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddInformation extends StatefulWidget {
  final uid;
  const AddInformation({super.key, required this.uid});

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  final _formKey = GlobalKey<FormState>(); // 폼 키로 유효성 검사를 처리
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _randomNickName = "닉네임을 입력해주세요.";
  NicknameGenerator generator = NicknameGenerator();

  AccountService accountService = AccountService();

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
                    "추가 정보를 입력해주세요",
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
                                // 추가 정보 입력완료 버튼
                                CustomButton(
                                  buttonText: "입력 완료",
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        final name =
                                            _nameController.text.trim();
                                        final nickname =
                                            _nicknameController.text.trim();
                                        final email =
                                            _emailController.text.trim();

                                        // Firestore 업데이트
                                        await AccountService()
                                            .updateUserInformation(
                                          uid: widget.uid,
                                          name: name,
                                          nickname: nickname,
                                          email: email,
                                        );

                                        // 홈 화면으로 이동
                                        if (mounted) {
                                          context.go('/home');
                                        }
                                      } catch (error) {
                                        print("정보 업데이트 실패: $error");
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text("정보 업데이트에 실패했습니다."),
                                          ),
                                        );
                                      }
                                    }
                                  },
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
