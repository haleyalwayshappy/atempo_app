import 'package:flutter/material.dart';

class MusicPlayScreen extends StatelessWidget {
  final VoidCallback onNavigateBack;
  final VoidCallback onNavigateToList;

  /// 음악 재생화면
  const MusicPlayScreen({
    super.key,
    required this.onNavigateBack,
    required this.onNavigateToList,
  });

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
