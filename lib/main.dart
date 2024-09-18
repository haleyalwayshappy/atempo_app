import 'package:atempo_app/screens/account/login_email_screen.dart';
import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/diary/diary_grid_widget.dart';
import 'package:atempo_app/screens/diary/diary_list_widget.dart';
import 'package:atempo_app/screens/diary/diary_read_screen.dart';
import 'package:atempo_app/widgets/list_widget.dart';
import 'package:atempo_app/screens/diary/diary_main_screen.dart';
import 'package:atempo_app/screens/home/choice_emotion_screen.dart';
import 'package:atempo_app/screens/home/home_screen.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/bottom_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainScreenApp());

class MainScreenApp extends StatefulWidget {
  const MainScreenApp({super.key});

  @override
  State<MainScreenApp> createState() => _MainScreenAppState();
}

class _MainScreenAppState extends State<MainScreenApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
      // home: DiaryMainScreen(),// 다이어리 메인 화면
      // home: DiaryReadScreen(), // 다이어리 읽기 화면
      // home: HomeScreen(), // 홈 화면
      home: DiaryReadScreen(), // 홈 화면
    );
  }
}
