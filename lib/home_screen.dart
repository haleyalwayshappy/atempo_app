import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // 화면 부분
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      // 0번 인덱스 화면
      '달력화면',
      style: optionStyle,
    ),
    Text(
      //1번인덱스 화면
      '홈화면',
      style: optionStyle,
    ),
    Text(
      //2번 인덱스 화면
      '음악 재생화면',
      style: optionStyle,
    ),
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
        title: const Text('a Tempo',
        style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent ,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
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
      body: Center(
        child: Column(
          children: <Widget>[
            _widgetOptions.elementAt(_selectedIndex),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    print("버튼 누름");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("로그인 성공"),
                    ));
                  },
                  icon: Icon(Icons.play_arrow),
                ),
              ],
            ),
          ],
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              size:32,
            ),
            label: 'diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size:32,),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.queue_music_rounded,
              size:32,
            ),
            label: 'music',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


// void flutterToast(){
//
//   Fluttertoast.showToast(
//       msg: "음악재생!!",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.TOP,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0
//   );
//
// }
