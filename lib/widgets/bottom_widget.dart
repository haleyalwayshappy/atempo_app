import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomWidget extends StatefulWidget {
  final Widget child;

  const BottomWidget({super.key, required this.child});

  @override
  State<BottomWidget> createState() => _BottomWidget();
}

class _BottomWidget extends State<BottomWidget> {
  int _selectedIndex = 1; // 0 : 음악 , 1: 홈 , 2 : 일기

  void onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // 뮤직탭
        context.go('/music');
        break;
      case 1: // 홈탭
        context.go('/home');
        break;
      case 2: // 다이어리탭
        context.go('/diary');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _buildCurrentScreen(), // 화면 변경
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: mBackgroundColor,
        // indicatorColor: mPrimaryColor,
        // selectedIndex: _selectedIndex,
        // onDestinationSelected: onDestinationSelected,

        /// 바텀위젯 꾸미는 코드
        showSelectedLabels: false, // 선택된 란 텍스트 비활성화
        showUnselectedLabels: false, // 선택되지 않은 란 텍스트 비활성화
        unselectedItemColor: mDisabledColor,
        selectedItemColor: mEnabledColor,
        currentIndex: _selectedIndex,

        onTap: (index) {
          onDestinationSelected(index);
          switch (index) {
            case 0:
              context.go('/music');
            case 1:
              context.go('/home');
            case 2:
              context.go('/diary');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones),
            label: '음악',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '일기',
          ),
        ],

        // destinations: const [
        //   NavigationDestination(
        //     icon: Icon(Icons.headphones, size: 26),
        //     label: '',
        //   ),
        //   NavigationDestination(
        //     icon: Icon(
        //       Icons.home,
        //       size: 26,
        //     ),
        //     label: '',
        //   ),
        //   NavigationDestination(
        //       icon: Icon(
        //         Icons.calendar_month,
        //         size: 26,
        //       ),
        //       label: ''),
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 새로운 일기 작성 페이지로 이동
          context.go('/write'); // 새로운 일기 작성 경로로 이동
        }, // 플로팅 버튼 아이콘
        backgroundColor: mPrimaryColor,
        shape: CircleBorder(), // 동그라미 모양으로 설정
        elevation: 2.4,
        child: Icon(
          Icons.add,
          color: mEnabledColor,
          size: 40,
        ), // 플로팅 버튼 배경색
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // 플로팅 버튼 위치 설정
    );
  }
}
