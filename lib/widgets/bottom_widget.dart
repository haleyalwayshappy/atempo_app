import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/screens/diary/diary_main_screen.dart';
import 'package:atempo_app/screens/home/home_screen.dart';
import 'package:atempo_app/screens/music/music_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomWidget();
}

class _BottomWidget extends State<BottomWidget> {
  int _selectedIndex = 2;

/*
  final List<Widget> _screens = [
    MusicMainScreen(),
    HomeScreen(),
    DiaryMainScreen(),
  ];
*/

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

/*    switch (index) {
      case 0: // 뮤직탭
        context.go('/');
        break;
      case 1: // 홈탭
        context.go('/');
        break;
      case 2: // 다이어리탭
        context.go('/');
        break;
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentScreen(), // 화면 변경
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.headphones,
                size: 32,
              ),
              label: 'Music',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                size: 32,
              ),
              label: 'Diary',
            ),
          ],

          /// 바텀위젯 꾸미는 코드
          currentIndex: _selectedIndex,
          unselectedItemColor: mDisabledColor,
          selectedItemColor: mEnabledColor,
          backgroundColor: mBackgroundColor,
          onTap: (index) {
            _onItemTapped(index);
            switch (index) {
              case 0: // 뮤직탭
                context.go('/');
                break;
              case 1: // 홈탭
                context.go('/');
                break;
              case 2: // 다이어리탭
                context.go('/');
                break;
            }
          }),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return MusicMainScreen();
      case 1:
        return HomeScreen();
      case 2:
        return DiaryMainScreen();
      default:
        return HomeScreen();
    }
  }
}