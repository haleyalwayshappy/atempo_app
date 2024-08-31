import 'package:atempo_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'diary/diary_main_screen.dart';
import 'home/home_screen.dart';
import 'music/music_main_screen.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const MainScreenApp());

class MainScreenApp extends StatelessWidget {
  const MainScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
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
      backgroundColor: wBackgroundColor,
      body: _screens[_selectedIndex],
      // body: Container(
      //   child: _screens.elementAt(_selectedIndex),
      // ),

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
        unselectedItemColor: wDisabledColor,
        selectedItemColor: wPrimaryColor,
        backgroundColor: wBackgroundColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

// 토스트 패키지 1
void flutterToast() {
  Fluttertoast.showToast(
      msg: "음악재생!!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black12,
      textColor: Colors.white,
      fontSize: 16.0);
}


      // 플로팅 버튼
      // floatingActionButton: const FloatingActionButton(
      //   onPressed: flutterToast,
      //   backgroundColor: Colors.green,
      //   child: Icon(Icons.add),
      // ),
