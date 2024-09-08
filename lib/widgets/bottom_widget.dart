import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/screens/diary/diary_main_screen.dart';
import 'package:atempo_app/screens/home/home_screen.dart';
import 'package:atempo_app/screens/music/music_main_screen.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [BottomNavigationBar].

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _MainScreen();
}

class _MainScreen extends State<BottomWidget> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    MusicMainScreen(),
    HomeScreen(),
    DiaryMainScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
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
        currentIndex: _selectedIndex,
        unselectedItemColor: mDisabledColor,
        selectedItemColor: mEnabledColor,
        backgroundColor: mBackgroundColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
