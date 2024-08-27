import 'package:flutter/material.dart';

abstract class Palette {
  static Color deepPurple = Color(0xff21004A);
  static Color realWhite = Color(0xffffffff);
  static Color selectedItem = Color(0xff95D981);
}

// 왜 abstract 를 썼을까? > 알아보기
//
// 클래스를 쓰는건 맞고, 앱스트랙트를 쓰는건 목적이없다.
