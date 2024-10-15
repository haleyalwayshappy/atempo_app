import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        centerTitle: false,
        title: Text(
          "마이페이지",
          style: TextStyle(
            color: mFontDarkColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: mFontDarkColor),
          onPressed: () {
            context.go('/home');
          },
        ),
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

              // 펫추가
              GestureDetector(
                onTap: () {},
                child: Text(
                  '일기 히스토리',
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

              // 획득한 메달
              GestureDetector(
                onTap: () {},
                child: Text(
                  '획득한 메달',
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

              // 공개한 성장일기
              GestureDetector(
                onTap: () {},
                child: Text(
                  '공개한 성장일기',
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

              // 공감한 성장일기
              GestureDetector(
                onTap: () {},
                child: Text(
                  '좋아요한 성장일기',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 40),

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
                    fontSize: 20,
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
                    fontSize: 20,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
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
