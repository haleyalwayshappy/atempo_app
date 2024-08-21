import 'package:atempo_app/diary/diary_main_screen.dart';
import 'package:atempo_app/home_screen.dart';
import 'package:atempo_app/music/music_main_screen.dart';
import 'package:atempo_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const FrameScreenApp());

class FrameScreenApp extends StatelessWidget {
  const FrameScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FrameScreen(),
    );
  }
}

class FrameScreen extends StatefulWidget {
  const FrameScreen({super.key});

  @override
  State<FrameScreen> createState() => _MainScreen();
}

class _MainScreen extends State<FrameScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
      backgroundColor: Palette.backgroundDeepPurple,
      body: Container(
        child: _screens.elementAt(_selectedIndex),
      ),

      // 플로팅 버튼
      // floatingActionButton: const FloatingActionButton(
      //   onPressed: flutterToast,
      //   backgroundColor: Colors.green,
      //   child: Icon(Icons.add),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Palette.backgroundDeepPurple,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.queue_music_rounded,
              size: 32,
            ),
            label: 'music',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              size: 32,
            ),
            label: 'diary',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Palette.fontWhite,
        selectedItemColor: Palette.selectedItem,
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
