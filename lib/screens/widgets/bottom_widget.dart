import 'package:atempo_app/screens/music/widget/music_statusbar.dart';
import 'package:atempo_app/screens/widgets/custom_floating_button.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BottomWidget extends StatefulWidget {
  // final Widget child;
  final StatefulNavigationShell child;

  const BottomWidget({super.key, required this.child});

  @override
  State<BottomWidget> createState() => _BottomWidget();
}

class _BottomWidget extends State<BottomWidget> {
  late int _selectedIndex = 1; // 0 : 음악 , 1: 홈 , 2 : 일기

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

  Widget? fabJh() {
    var currentLocation = widget.child.shellRouteContext.routerState.location;
    print("cureentLocation -> $currentLocation");
    // 플로팅 버튼을 숨길 경로를 확인
    if (currentLocation == '/diary/write' ||
        currentLocation.startsWith('/diary/read/') ||
        currentLocation == '/music_player') {
      return null; // 해당 경로에서는 플로팅 버튼 숨기기
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 65),
      child: CustomFloatingActionButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FabController fabController = Get.put(FabController());

    /// todo: build에서 put은 하면 안됨. JH

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: widget.child,
          ),

          /// 음악 재생 화면
          MusicStatusBar(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 70, // 높이 조정
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          backgroundColor: mBackgroundColor,
          // 배경 색상 설정
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (int index) {
            onChangedNavigation(index);
          },

          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.headphones),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.home),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: '',
            ),
          ],
          indicatorColor: mSecondaryColor, // 선택된 탭의 배경색 비활성화
        ),
      ),
      // floatingActionButton: Obx(() {
      //   return fabController.isFabVisible.value
      //       ? Padding(
      //           padding: const EdgeInsets.only(bottom: 65),
      //           child: CustomFloatingActionButton(),
      //         )
      //       : SizedBox.shrink(); // FAB가 숨겨진 경우 아무것도 표시하지 않음
      // }),
      floatingActionButton: fabJh(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class FabController extends GetxController {
  // FAB의 표시 여부를 관리하는 변수
  var isFabVisible = false.obs;

  // FAB 표시 여부를 변경하는 메소드
  void showFab() {
    isFabVisible.value = true;
  }

  void hideFab() {
    isFabVisible.value = false;
  }
}
