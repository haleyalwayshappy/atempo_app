import 'package:atempo_app/view/pages/home/choice_emotion_screen.dart';
import 'package:atempo_app/firebase_options.dart';
import 'package:atempo_app/screens/diary/diary_list_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainScreenApp());
}

class MainScreenApp extends StatelessWidget {
  const MainScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChoiceEmotionScreen(),
    );
  }
}
