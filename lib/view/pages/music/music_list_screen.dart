import 'package:flutter/material.dart';

class MusicListScreen extends StatelessWidget {
  final VoidCallback onNavigateBack;
  final VoidCallback onNavigateToPlay;
  const MusicListScreen({
    super.key,
    required this.onNavigateBack,
    required this.onNavigateToPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("음악 리스트 화면"),
            ElevatedButton(onPressed: onNavigateBack, child: Text("back")),
          ],
        ),
      ),
    );
  }
}
