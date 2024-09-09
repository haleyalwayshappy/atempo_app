import 'package:flutter/material.dart';

const Color mBackgroundColor = Color(0xfff4f9f3);

const Color mPrimaryColor = Color(0xff61B15A);
const Color mSecondaryColor = Color(0xffAFD8AC);

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

const mDiaryStyle = TextStyle(
  color: mFontDarkColor,
  fontFamily: 'Santteut',
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
  height: 1.2,
);

const kSearchEditHintStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.w700,
  fontSize: 15.0,
  height: 1.2,
);

const Map<dynamic, dynamic> emotionText = {
  "happy": "행복해요!",
  "sad": "슬퍼요",
  "angry": "화가나요",
  "confused": "혼란스러워요",
  "peaceful": "편안해요."
};

/// 왼쪽오른쪽 여백 값 고정
const double outlinedDouble = 15.0;

const List<String> emailSiteList = [
  'gmail.com',
  'naver.com',
  'daum.net',
  'hanmail.net'
];

final List<Map<String, String>> musicItems = [
  // index : "1" , image: "
  {'index': '1', 'image': 'assets/images/maru1.jpeg', 'text': 'Musssssic 1'},
  {'index': '2', 'image': 'assets/images/maru2.jpeg', 'text': 'Music 2'},
  {'index': '3', 'image': 'assets/images/maru3.jpeg', 'text': 'Music 3'},
  {'index': '4', 'image': 'assets/images/maru4.jpeg', 'text': 'Music 4'},
  {'index': '5', 'image': 'assets/images/maru1.jpeg', 'text': 'Music 5'},
];
