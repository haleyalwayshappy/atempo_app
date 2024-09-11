import 'package:atempo_app/screens/account/login_email_screen.dart';
import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/diary/diary_list_screen.dart';
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
      home: DiaryListScreen(),
    );
  }
}
