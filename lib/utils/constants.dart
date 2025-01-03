import 'package:flutter/material.dart';

/* 색상 */
const Color mBackgroundColor = Color(0xffFCFEFC); // 배경화면

const Color mPrimaryColor = Color(0xff61B15A); // 메인 색상
const Color mSecondaryColor = Color(0xffAFD8AC); // 서브 색상(메인색상보다 조금 밝음)

const Color mFontDarkColor = Color(0xff0D1A0C);
const Color mFontLightColor = Color(0xffF4FAF4);

const Color mButtonColor = Color(0xff498E43);
const Color mEnabledColor = Color(0xff2E5A2A);
const Color mDisabledColor = Color(0xffC2C2C2);

// grey colors
const Color mGrey1Color = Color(0xff666666);
const Color mGrey2Color = Color(0xff858585);
const Color mGrey3Color = Color(0xffA3A3A3);
const Color mGrey4Color = Color(0xffC2C2C2);
const Color mGrey5Color = Color(0xffD9D9D9);

// self RGB colors
const Color mRedColor = Color(0xFFff5543);
const Color mBlueColor = Color(0xff34a4e8);
const Color mYellowColor = Color(0xffffc933);

// sub color
const Color mDarkGreenColor = Color(0xff498E43);
const Color mLightGreenColor = Color(0xff82C17C);

// emotion color
const Color mJoyColor = Color(0xffFFDD50);
const Color mSadColor = Color(0xff76A7FF);
const Color mAngryColor = Color(0xffFF8571);
const Color mPeacefulColor = Color(0xff82C17C);
const Color mConfusedColor = Color(0xff9F78FF);

// 왼쪽오른쪽 여백 값 고정
const double outlinedDouble = 16.0;
const double radiusDouble = 26.0;

/* 일기 내용 관련 스타일 */
const mDiaryStyle = TextStyle(
  color: mFontDarkColor,
  fontFamily: 'Santteut',
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
  letterSpacing: 1.1,
);

/* 전역 리스트*/

/// 감정 선택시 텍스트 변환
const Map<dynamic, dynamic> emotionText = {
  "happy": "행복해요!",
  "sad": "슬퍼요",
  "angry": "화가나요",
  "confused": "혼란스러워요",
  "peaceful": "편안해요."
};

/// 이메일 리스트
const List<String> emailSiteList = [
  'gmail.com',
  'naver.com',
  'daum.net',
  'hanmail.net'
];

/// 앨범 커버 이미지 리스트
const Map<dynamic, dynamic> albumContents = {
  "도시의 낮잠": "assets/images/music_cover1.png",
  "숲의 속삭임": "assets/images/music_cover2.png",
  "바람의 화음": "assets/images/music_cover3.png",
  "고요의 물결": "assets/images/music_cover4.png",
  "하늘의 메아리": "assets/images/music_cover5.png",
  "Dawning Serenity": "assets/images/music_cover6.png",
  "도시의 신기루": "assets/images/music_cover7.png",
  "새벽의 절규": "assets/images/music_cover8.png",
  "Whispering Winds": "assets/images/music_cover9.png",
  "여명의 멜로디": "assets/images/music_cover10.png",
};

// const kSearchEditHintStyle = TextStyle(
//   color: Colors.grey,
//   fontWeight: FontWeight.w700,
//   fontSize: 15.0,
//   height: 1.2,
// );
