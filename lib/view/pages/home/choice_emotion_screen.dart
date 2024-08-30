import 'package:flutter/material.dart';

import '../bottom_navigation_basic.dart';


class ChoiceEmotionScreen extends StatelessWidget {
  const ChoiceEmotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("감정 선택화면"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreenApp(),
                ),
              );
            },
            child: Text("페이지 이동"),
          ),

        ],
      ),
    );
  }
}
