import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CounterController extends GetxController {
  var count = 0.obs; // 'obs'를 붙이면 반응형 변수가 됨

  void increment() {
    count++;
  }
}

class GetxTest extends StatelessWidget {
  final CounterController controller = Get.put(CounterController()); // 의존성 주입

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX 상태 관리")),
      body: Center(
        child: Obx(() => Text("Count: ${controller.count}")), // 반응형 위젯
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment, // 상태 변화
        child: Icon(Icons.add),
      ),
    );
  }
}
