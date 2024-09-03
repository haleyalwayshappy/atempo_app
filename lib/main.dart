import 'package:atempo_app/view/pages/account/login_screen.dart';
import 'package:atempo_app/view/pages/home/choice_emotion_screen.dart';
import 'package:atempo_app/view/pages/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainScreenApp());

class MainScreenApp extends StatelessWidget {
  const MainScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
