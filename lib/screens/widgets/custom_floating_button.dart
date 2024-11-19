import 'package:atempo_app/screens/widgets/custom_datepicker_dialog.dart';
import 'package:atempo_app/controller/diary/date_controller.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

class CustomFloatingActionButton extends StatefulWidget {
  // 생성자에서 필요한 값을 전달받음

  const CustomFloatingActionButton({
    super.key,
  });

  @override
  State<CustomFloatingActionButton> createState() {
    return _CustomFloatingActionButtonState();
  }
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  bool isOpen = false; // 메뉴 상태를 저장하는 변수
  //
  // Future<void> _showCupertinoDatePicker(BuildContext context) async {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext builder) {
  //       return Container(
  //         height: 254,
  //         color: Colors.white,
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: 200,
  //               child: CupertinoDatePicker(
  //                 mode: CupertinoDatePickerMode.date,
  //                 initialDateTime:
  //                     dateController.selectedDate.value ?? DateTime.now(),
  //                 minimumDate: DateTime(2000),
  //                 maximumDate: DateTime(2100),
  //                 onDateTimeChanged: (DateTime newDate) {
  //                   dateController.setDate(newDate); // 선택된 날짜를 GetX 컨트롤러에 저장
  //                 },
  //               ),
  //             ),
  //             CupertinoButton(
  //               child: const Text('확인'),
  //               onPressed: () {
  //                 Navigator.of(context).pop(); // 팝업 닫기
  //               },
  //             )
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // // 달력 상태 변경하기
  // Future<void> _openDatePickerDialog(BuildContext context) async {
  //   print("ggkhk");
  //
  //   final DateController dateController = Get.find<DateController>();
  //
  //   final DateTime? pickedDate = await showDatePicker(
  //       context: context, firstDate: DateTime(2000), lastDate: DateTime(2100));
  //   if (pickedDate != null) {
  //     dateController.setDate(pickedDate); // 선택한 날짜를 Controller에 저장
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      toggleButtonMargin: 0.0,
      toggleButtonSize: 32.0,
      toggleButtonAnimatedIconData: AnimatedIcons.menu_close,
      alignment: Alignment.bottomRight,
      toggleButtonIconColor: mFontLightColor,
      toggleButtonColor: mPrimaryColor,
      items: [
        CircularMenuItem(
            icon: Icons.edit,
            color: mAngryColor,
            margin: 0,
            onTap: () {
              context.go('/write');
              // _openDatePickerDialog(context);
              // _showCupertinoDatePicker(context);
            }),
        CircularMenuItem(
            icon: Icons.create,
            margin: 0,
            color: mSadColor,
            onTap: () {
              context.go('/music_player');
            }),
        CircularMenuItem(
            icon: Icons.abc_outlined,
            margin: 0,
            color: mConfusedColor,
            onTap: () {}),
      ],
    );
  }

  // 커스텀 토글 버튼
  Widget _buildCustomToggleButton() {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () {
        setState(() {
          isOpen = !isOpen; // 메뉴 열고 닫기
        });
      },
      child: Icon(
        isOpen ? Icons.close : Icons.menu, // 열린 상태에 따라 아이콘 변경
        color: Colors.white,
      ),
    );
  }
}

//
// class CustomFloatingActionButton extends StatefulWidget {
//   // 생성자에서 필요한 값을 전달받음
//   const CustomFloatingActionButton({
//     super.key,
//   });
//
//   @override
//   State<CustomFloatingActionButton> createState() =>
//       _CustomFloatingActionButtonState();
// }
//
// class _CustomFloatingActionButtonState
//     extends State<CustomFloatingActionButton> {
//   @override
//   Widget build(BuildContext context) {
//     return CircularMenu(
//       toggleButtonMargin: 0.0,
//       toggleButtonSize: 32.0,
//       toggleButtonAnimatedIconData: AnimatedIcons.menu_close,
//       alignment: Alignment.bottomRight,
//       toggleButtonIconColor: mFontLightColor,
//       toggleButtonColor: mPrimaryColor,
//       items: [
//         CircularMenuItem(
//             icon: Icons.create_rounded,
//             color: mAngryColor,
//             onTap: () {
//               context.go('/diary/write');
//             }),
//         CircularMenuItem(
//             icon: Icons.create_rounded, color: mSadColor, onTap: () {}),
//         CircularMenuItem(
//             icon: Icons.abc_outlined, color: mConfusedColor, onTap: () {}),
//       ],
//     );
//   }
// }
//

//DiaryFormatDialog
