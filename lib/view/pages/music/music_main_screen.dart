import 'package:atempo_app/constants/constants.dart';
import 'package:atempo_app/view/pages/music/music_play_screen.dart';
import 'package:flutter/material.dart';

import 'music_list_screen.dart';

class MusicMainScreen extends StatefulWidget {
  const MusicMainScreen({super.key});

  @override
  State<MusicMainScreen> createState() => _MusicMainScreenState();
}

/// 음악 메인화면 (내부 화면 이동 처리
class _MusicMainScreenState extends State<MusicMainScreen> {
  int _currentScreenIndex = 0;

  void _navigateTo(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: wBackgroundColor,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 24.0,
        ),
        title: GestureDetector(
          onTap: () {
            _navigateTo(0);
          },
          child: const Text(
            "음악",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        elevation: 1.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                size: 28.0,
              ))
        ],
      ),
      body: IndexedStack(
        index: _currentScreenIndex,
        children: [
          MusicHomeScreen(
            onNavigateToPlay: () {
              _navigateTo(1); // MusicPlayScreen으로 이동
            },
            onNavigateToList: () {
              _navigateTo(2); // MusicListScreen으로 이동
            },
          ),
          MusicPlayScreen(
            onNavigateBack: () {
              _navigateTo(0); // MusicHomeScreen으로 이동
            },
          ),
          MusicListScreen(
            onNavigateBack: () {
              _navigateTo(0); // MusicHomeScreen으로 이동
            },
          ),
        ],
      ),
    );
  }
}

class MusicHomeScreen extends StatelessWidget {
  final VoidCallback onNavigateToPlay;
  final VoidCallback onNavigateToList;

  const MusicHomeScreen({
    required this.onNavigateToPlay,
    required this.onNavigateToList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onNavigateToPlay,
          child: Text("재생화면으로 이동"),
        ),
        ElevatedButton(
          onPressed: onNavigateToList,
          child: Text("목록 화면으로 이동 "),
        ),
      ],
    );
  }
}
