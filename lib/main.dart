<<<<<<< Updated upstream
import 'package:atempo_app/view/pages/home/choice_emotion_screen.dart';
=======
import 'package:atempo_app/firebase_options.dart';
import 'package:atempo_app/screens/account/login_email_screen.dart';
import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/diary/diary_list_screen.dart';
import 'package:atempo_app/screens/diary/diary_main_screen.dart';
import 'package:atempo_app/screens/home/choice_emotion_screen.dart';
import 'package:atempo_app/screens/home/home_screen.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/bottom_widget.dart';
import 'package:firebase_core/firebase_core.dart';
>>>>>>> Stashed changes
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
