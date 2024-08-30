import 'package:flutter/material.dart';
import 'music_main_screen.dart';  // 공개된 MusicMainScreenState를 가져옴

class MusicPlayScreen extends StatelessWidget {
  final VoidCallback onNavigateBack;
  const MusicPlayScreen({super.key, required this.onNavigateBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("음악 재생화면"),
            IconButton(
              onPressed: onNavigateBack,
              icon: const Icon(Icons.arrow_back),
            )
          ],
        ),
      ),
    );
  }
}
