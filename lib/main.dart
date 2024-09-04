import 'package:atempo_app/components/bottom_widget.dart';
import 'package:atempo_app/constants/constants.dart';
import 'package:atempo_app/view/pages/account/login_screen.dart';
import 'package:atempo_app/view/pages/diary/diary_main_screen.dart';
import 'package:atempo_app/view/pages/home/choice_emotion_screen.dart';
import 'package:atempo_app/view/pages/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainScreenApp());

class MainScreenApp extends StatelessWidget {
  const MainScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Pretendard",
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: mEnabledColor,
            size: 32,
          ),
          backgroundColor: mBackgroundColor,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: mFontDarkColor,
            fontSize: 24,
            fontWeight: FontWeight.w800,
            letterSpacing: 4.0,
          ),
        ),
        scaffoldBackgroundColor: mBackgroundColor,
      ),
      home: BottomWidget(),
    );
  }
}
