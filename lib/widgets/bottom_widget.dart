import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomWidget extends StatefulWidget {
  final Widget child;

  const BottomWidget({super.key, required this.child});

  @override
  State<BottomWidget> createState() => _BottomWidget();
}

class _BottomWidget extends State<BottomWidget> {
  int _selectedIndex = 0; // 0 : 음악 , 1: 홈 , 2 : 일기

  void onChangedNavigation(int index) {
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
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.child);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        /// 바텀위젯 꾸미는 코드
        showSelectedLabels: false,
        // 선택된 란 텍스트 비활성화
        showUnselectedLabels: false,
        // 선택되지 않은 란 텍스트 비활성화
        unselectedItemColor: mDisabledColor,
        selectedItemColor: mEnabledColor,
        currentIndex: _selectedIndex,
        backgroundColor: mBackgroundColor,

        onTap: (index) {
          onChangedNavigation(index);
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
      ),
      floatingActionButton: (_selectedIndex == 1 || _selectedIndex == 2)
          ? CustomFloatingActionButton()
          : null, // _selectedIndex가 1이나 2가 아닐 때는 버튼을 표시하지 않음
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

/*
*
* */
