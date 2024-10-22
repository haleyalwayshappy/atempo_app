import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'; // Assuming you have constants for colors, etc.
import 'package:firebase_auth/firebase_auth.dart'; // Firebase User 사용을 위한 import

class MyPageScreen extends StatelessWidget {
  final bool isLogin = false;
  const MyPageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // If not logged in, navigate to login or show a login prompt
    // if (!isLogin) {
    //   return Scaffold(
    //     backgroundColor: mBackgroundColor,
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(
    //             "로그인이 필요합니다.",
    //             style: TextStyle(
    //               fontSize: 20,
    //               color: mFontDarkColor,
    //               fontWeight: FontWeight.w600,
    //               fontFamily: 'Pretendard',
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           ElevatedButton(
    //             onPressed: () {
    //               context.go('/login'); // Navigate to login screen
    //             },
    //             child: Text('로그인 하러가기'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // If logged in, show the MyPage screen
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "마이페이지",
        isMyPage: true,
        showBackButton: true,
      ),
      backgroundColor: mBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  // 프로필 사진
                  Stack(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: mGrey2Color,
                            width: 1.0,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Icon(
                              color: Colors.white,
                              size: 15,
                              Icons.camera_alt,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 12),
                  // 닉네임
                  Text(
                    "롱롱",
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: mFontDarkColor,
                      letterSpacing: -0.5,
                    ),
                  ),
                  // 닉네임 수정
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              SizedBox(height: 40),
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
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

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
