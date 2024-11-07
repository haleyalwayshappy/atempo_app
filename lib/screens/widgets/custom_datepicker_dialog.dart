import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:go_router/go_router.dart';

///  TODO : 알럿 다이얼로그를 커스텀으로 만들고싶으면 extend를 alertDialog로 만들어야함(stless 같은게 아닌)
/// 1번 방법( 클래스 처럼 쓸경우) alert dialog extends 하는 방법찾기
/// 2번 : 함수화 return type == widget , custom
AlertDialog customAlertDialog({
  required BuildContext context,
  required DateTime selectedDate,
  required Function(DateTime) customOnPressed,
}) {
  DateTime? selectedDateTime;

  return AlertDialog(
    title: Text('Select Date'),
    content: SizedBox(
      height: 200,
      child: CalendarDatePicker(
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),

        /// 콜백
        onDateChanged: (DateTime datetime) {
          selectedDateTime = datetime;
        },
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context); // 취소 시 다이얼로그 닫기
        },
        child: Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          customOnPressed(selectedDateTime!);
          // onPressed 는 voidCallback임
        },

        // TODO calendar에 선택된 값을 여기서 읽을 수 있어야한다.
        // 어딘가에 a를 보내야한다.
        /// a 를 어디에 담지
        /// 함수 바디 내에 담는다? 담아서 화면으로 보낸다.

        //   // selectedDate 값 가지고 넘기기
        //   context.go('/diary/write'); // 선택된 날짜 반환
        child: Text('OK'),
      ),
    ],
  );
}

class CustomCalendarDatePicker extends StatefulWidget {
  const CustomCalendarDatePicker({super.key});

  @override
  State<CustomCalendarDatePicker> createState() =>
      _CustomCalendarDatePickerState();
}

class _CustomCalendarDatePickerState extends State<CustomCalendarDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),

        /// 콜백
        onDateChanged: (DateTime datetime) {
          // selectedDateTime = datetime;
        },
      ),
    );
  }
}
