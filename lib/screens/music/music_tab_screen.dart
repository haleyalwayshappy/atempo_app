import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/music/audiobook_screen.dart';
import 'package:atempo_app/screens/music/music_screen.dart';
import 'package:atempo_app/screens/music/widget/music_statusbar.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MusicTabScreen extends StatefulWidget {
  final Widget child;
  const MusicTabScreen({super.key, required this.child});

  @override
  State<MusicTabScreen> createState() => _MusicTabScreenState();
}

class _MusicTabScreenState extends State<MusicTabScreen> {
  int _selectedIndex = 1; // 0 : 뮤직  1:오디오북

  void onChangedNavigation(int index) {
    switch (index) {
      case 0: // 뮤직
        context.go('/home/music');
        break;
      case 1: // 오디오북
        context.go('/home/audiobook');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: '음악'),
      body: DefaultTabController(
        length: 2, // Tab의 개수
        child: Column(
          children: <Widget>[
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                children: const [
                  MusicScreen(),
                  AudiobookScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 탭바 빌드 메소드
  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 180.0), // 좌우 여백 설정
      child: TabBar(
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(text: '음악'),
          Tab(text: '오디오북'),
        ],
        labelColor: mPrimaryColor,
        // 활성화된 탭 글씨 색상
        unselectedLabelColor: mGrey1Color,
        // 비활성화된 탭 글씨 색상
        indicatorColor: mPrimaryColor,
        indicatorWeight: 0.1,
        indicatorSize: TabBarIndicatorSize.label, // 텍스트 길이에 맞추기
      ),
    );
  }
}
