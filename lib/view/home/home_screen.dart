import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "홈 스크린",
        style: TextStyle(color: Colors.purple.shade400),
      ),
    );
  }
}
