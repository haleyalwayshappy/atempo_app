import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/controller/account/app_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'; // Assuming you have constants for colors, etc.

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // AppUserController를 가져옴
    final AppUserController userController = Get.find<AppUserController>();

    return Scaffold(
      appBar: CustomAppBar(
        titleText: "마이페이지",
        isMyPage: true,
        showBackButton: true,
      ),
      backgroundColor: mBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // 프로필 사진

                  // const SizedBox(width: 12),
                  // 이름
                  Obx(() {
                    final appUser = userController.appUser.value;
                    if (appUser == null) {
                      return const Text("등록된 이름이 없습니다.");
                    } else {
                      return Text(
                        appUser.name,
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: mFontDarkColor,
                          letterSpacing: 1.2,
                        ),
                      );
                    }
                  }),
                  // 닉네임 수정
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // 구분선
              Container(
                height: 1,
                color: mGrey2Color,
              ),
              SizedBox(height: 40),
              // MY
              Text(
                'MY',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: mFontDarkColor,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 20),
              // 일기 보관
              GestureDetector(
                onTap: () {},
                child: Text(
                  '보관된 일기',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 14),
              GestureDetector(
                onTap: () {},
                child: Text(
                  '일기 통계',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 14),
              GestureDetector(
                onTap: () {},
                child: Text(
                  '뮤직 히스토리',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 14),
              // 구분선
              Container(
                height: 1,
                color: mGrey2Color,
              ),
              SizedBox(height: 40),
              // 계정
              Text(
                '계정',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: mFontDarkColor,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 20),
              // 로그아웃
              GestureDetector(
                onTap: () async {
                  print("프로필 수정 버튼 클릭");
                },
                child: Text(
                  '프로필 수정',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),

              SizedBox(height: 14),
              // 로그아웃
              GestureDetector(
                onTap: () async {
                  showLogoutDialog(context);
                  print("로그아웃버튼");
                },
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 14),
              // 회원탈퇴
              GestureDetector(
                onTap: () {
                  showDeleteAccountDialog(context);
                  // TODO :  회원 탈퇴 시 해당 계정 삭제 + 파이어 스토어에 있는 필드 삭제 (uid 기준)
                },
                child: Text(
                  '회원탈퇴',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: mGrey3Color,
                    letterSpacing: -0.5,
                    decoration: TextDecoration.underline, // 밑줄 추가
                    decorationColor: mGrey3Color, // 밑줄 색상 설정
                    decorationThickness: 2.0, // 밑줄 두께 설정
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                '앱정보',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: mGrey3Color,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 로그아웃 다이얼로그
void showLogoutDialog(BuildContext context) async {
  showDialog(
      context: context,
      builder: (BuildContext con) {
        return AlertDialog(
          title: const Text("로그아웃"),
          content: const Text("로그아웃 하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () async {
                try {
                  // FirebaseAuth의 현재 사용자 정보 가져오기
                  var user = FirebaseAuth.instance.currentUser;

                  if (user != null) {
                    // Firestore에서 로그인 방법 확인
                    DocumentSnapshot userDoc = await FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .get();

                    if (userDoc.exists) {
                      // Firestore에 저장된 로그인 방법 (signUpMethod) 가져오기
                      int signUpMethod = userDoc['signUpMethod'];

                      // 로그인 방법에 따라 처리
                      if (signUpMethod == 2) {
                        // 카카오 로그아웃 처리
                        try {
                          await UserApi.instance.logout();
                          print('카카오 로그아웃 성공');
                        } catch (error) {
                          print('카카오 로그아웃 실패: $error');
                        }
                      }

                      // Firebase 로그아웃 처리 (모든 로그인 방식에 대해 공통 적용)
                      await FirebaseAuth.instance.signOut();
                      print('Firebase 로그아웃 성공');
                    }
                  }
                } catch (error) {
                  print('로그아웃 실패: $error');
                }

                // 다이얼로그 닫기 및 로그인 화면으로 이동
                Navigator.of(con).pop();
                print("로그아웃 성공 로그인 이동");
                context.go('/login');
              },
              child: const Text("확인"),
            ),
            TextButton(
              onPressed: () => Navigator.of(con).pop(),
              child: const Text("취소"),
            ),
          ],
        );
      });
}

// 회원탈퇴
void showDeleteAccountDialog(BuildContext context) {
  final AppUserController userController = Get.find<AppUserController>();
  showDialog(
    context: context,
    builder: (BuildContext con) {
      return AlertDialog(
        title: const Text("회원탈퇴"),
        content: const Text("정말 탈퇴를 진행 하시겠습니까?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // 다이얼로그 닫기
            child: const Text("취소"),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back(); // 다이얼로그 닫기
              // 로그인 화면으로 이동
              context.go('/login');
              await userController.deleteAccount(context); // 회원 탈퇴 실행
            },
            child: const Text("확인"),
          ),
        ],
      );
    },
  );
}
