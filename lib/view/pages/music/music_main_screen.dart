import 'package:atempo_app/components/toast.dart';
import 'package:atempo_app/constants/constants.dart';
import 'package:atempo_app/view/pages/music/music_play_screen.dart';
import 'package:flutter/material.dart';

import 'music_list_screen.dart';

class MusicMainScreen extends StatefulWidget {
  const MusicMainScreen({super.key});
/* stateful 로 변경한 이유는 콜백함수를 위해서임, 버튼을 누를때 화면 상태가 변경되기 때문 */

  @override
  State<MusicMainScreen> createState() => _MusicMainScreenState();
}

/// 음악 메인화면 (내부 화면 이동 처리
class _MusicMainScreenState extends State<MusicMainScreen> {
  int _currentScreenIndex = 0; // 현재 페이지 위치

  /// 화면 상태 변경 함수 (내부에서만 사용됨)
  void _navigateTo(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
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
        // TODO indexedStack 공부 하기
        index: _currentScreenIndex,
        children: [
          MusicHomeScreen(
            // 뮤직 메인스크린 화면
            onNavigateToPlay: () {
              flutterToast("화면 이동합니다.");
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
            onNavigateToList: () {
              flutterToast("화면 이동합니다.");
              _navigateTo(2); // MusicListScreen으로 이동
            },
          ),
          MusicListScreen(
            onNavigateBack: () {
              _navigateTo(0); // MusicHomeScreen으로 이동
            },
            onNavigateToPlay: () {
              _navigateTo(1); // MusicPlayScreen으로 이동
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

  /// 뮤직메인스크린 화면
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
