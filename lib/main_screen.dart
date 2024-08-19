import 'package:atempo_app/diary_main_screen.dart';
import 'package:atempo_app/home_screen.dart';
import 'package:atempo_app/music_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:radial_button/widget/circle_floating_button.dart';

import 'floating_button.dart';


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
  State<MainScreen> createState() =>
      _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _screens =[
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
      appBar: AppBar(
        centerTitle: false,
        title: Transform(
          transform: Matrix4.translationValues(16.0,0.0,0.0),
          child: const Text('a Tempo',
          style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent ,

        elevation: 0.0,
        actions: [
          IconButton(padding: const EdgeInsets.only(right: 16.0),
            icon: const Icon(
            Icons.person,
            color: Colors.black,
            size: 32,
            ),
            onPressed: () {
              print("마이페이지 버튼누름");
            },
          ),
        ],
      ),
      body: Container(
          child:_screens.elementAt(_selectedIndex),

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.queue_music_rounded,
              size:32,
            ),
            label: 'music',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size:32,),
            label: 'home',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              size:32,
            ),
            label: 'diary',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


// 토스트 패키지 1
void flutterToast(){
  Fluttertoast.showToast(
      msg: "음악재생!!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black12,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
