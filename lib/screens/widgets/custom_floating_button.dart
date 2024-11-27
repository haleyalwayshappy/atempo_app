import 'package:atempo_app/screens/diary/widget/diary_write_screen_4.dart';
import 'package:atempo_app/screens/widgets/custom_datepicker_dialog.dart';
import 'package:atempo_app/controller/diary/date_controller.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

// class CustomFloatingActionButton extends StatefulWidget {
//   // 생성자에서 필요한 값을 전달받음
//
//   const CustomFloatingActionButton({
//     super.key,
//   });
//
//   @override
//   State<CustomFloatingActionButton> createState() {
//     return _CustomFloatingActionButtonState();
//   }
// }
//
// class _CustomFloatingActionButtonState
//     extends State<CustomFloatingActionButton> {
//   bool isOpen = false; // 메뉴 상태를 저장하는 변수
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
//             icon: Icons.edit,
//             color: mAngryColor,
//             margin: 0,
//             onTap: () {
//               context.go('/write');
//               // _openDatePickerDialog(context);
//               // _showCupertinoDatePicker(context);
//             }),
//         CircularMenuItem(
//             icon: Icons.create,
//             margin: 0,
//             color: mSadColor,
//             onTap: () {
//               context.go('/music_player');
//             }),
//         CircularMenuItem(
//             icon: Icons.abc_outlined,
//             margin: 0,
//             color: mConfusedColor,
//             onTap: () {}),
//       ],
//     );
//   }
//
//   // 커스텀 토글 버튼
//   Widget _buildCustomToggleButton() {
//     return FloatingActionButton(
//       backgroundColor: Colors.blue,
//       onPressed: () {
//         setState(() {
//           isOpen = !isOpen; // 메뉴 열고 닫기
//         });
//       },
//       child: Icon(
//         isOpen ? Icons.close : Icons.menu, // 열린 상태에 따라 아이콘 변경
//         color: Colors.white,
//       ),
//     );
//   }
// }

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: mPeacefulColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          barrierColor: mBackgroundColor,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.95,
              child: DiaryWriteScreen4(),
            );
          },
        );
        // context.go('/write');
      },
      child: Icon(
        Icons.add,
        size: 32,
        color: Colors.white,
      ),
    );
  }
}
