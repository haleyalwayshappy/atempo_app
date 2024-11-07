import 'package:get/get.dart';

class DateController extends GetxController {
  // 선택한 날짜를 저장하는 Rx<DateTime?> 변수
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  // 날짜를 업데이트하는 함수
  void setDate(DateTime date) {
    selectedDate.value = date;
  }
}
