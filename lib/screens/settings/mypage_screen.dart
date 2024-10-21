import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:atempo_app/utils/constants.dart'; // Assuming you have constants for colors, etc.

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
                          image: DecorationImage(
                            image: AssetImage('assets/images/day6_bg2.jpeg'),
                            fit: BoxFit.cover, // 이미지를 적절히 맞추는 옵션
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
                onTap: () {},
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
                onTap: () {},
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
