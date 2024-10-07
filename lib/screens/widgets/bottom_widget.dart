import 'package:atempo_app/screens/music/widget/music_statusbar.dart';
import 'package:atempo_app/screens/widgets/custom_floating_button.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:go_router/go_router.dart';

class BottomWidget extends StatefulWidget {
  final Widget child;

  const BottomWidget({super.key, required this.child});

  @override
  State<BottomWidget> createState() => _BottomWidget();
}

class _BottomWidget extends State<BottomWidget> {
  int _selectedIndex = 1; // 0 : 음악 , 1: 홈 , 2 : 일기

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
    final FabController fabController = Get.put(FabController());

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: widget.child,
          ),
          MusicStatusBar(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90, // 높이 조정
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
      floatingActionButton: Obx(() {
        return fabController.isFabVisible.value
            ? Padding(
                padding: const EdgeInsets.only(bottom: 65),
                child: CustomFloatingActionButton(),
              )
            : SizedBox.shrink(); // FAB가 숨겨진 경우 아무것도 표시하지 않음
      }),
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
