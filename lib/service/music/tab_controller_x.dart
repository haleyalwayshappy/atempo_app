import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

// Tab 관련 상태를 관리하는 GetX 컨트롤러
class TabControllerX extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        // 탭 전환이 일어나면 라우팅 처리 (GoRouter로 처리)
        if (tabController.index == 0) {
          Get.context!.go('/music/screen');
        } else if (tabController.index == 1) {
          Get.context!.go('/music/audiobook');
        }
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
