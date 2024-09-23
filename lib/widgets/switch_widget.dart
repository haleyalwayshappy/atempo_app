import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatelessWidget {
  final bool isGridView; // 현재 뷰 타입
  final ValueChanged<bool> onToggle; // 상태 변경 콜백

  const CustomToggleSwitch({
    Key? key,
    required this.isGridView,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.rolling(
      current: isGridView ? 1 : 0, // isGridView에 따라 1 또는 0 설정
      values: const [0, 1], // 0: 리스트 뷰, 1: 그리드 뷰
      onChanged: (i) {
        onToggle(i == 1); // 콜백 호출하여 상태 변경
      },
      style: ToggleStyle(
        indicatorColor: mSecondaryColor,
        backgroundColor: Colors.transparent,
        borderColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      iconBuilder: (value, foreground) {
        return rollingIconBuilder(value, foreground); // 아이콘 빌더 호출
      },
    );
  }

  Widget rollingIconBuilder(int? value, bool foreground) {
    return Icon(iconDataByValue(value)); // 아이콘 반환
  }

  IconData iconDataByValue(int? value) => switch (value) {
        0 => Icons.list, // 리스트 뷰 아이콘
        1 => Icons.grid_view, // 그리드 뷰 아이콘
        // TODO: Handle this case.
        int() => throw UnimplementedError(),
        // TODO: Handle this case.
        null => throw UnimplementedError(),
      };
}

// class SwitchWidget extends StatefulWidget {
//   SwitchWidget({super.key});
//
//   @override
//   State<SwitchWidget> createState() => _SwitchWidgetState();
// }
//
// class _SwitchWidgetState extends State<SwitchWidget> {
//   bool isGridView = true;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedToggleSwitch<int>.rolling(
//       current: isGridView ? 1 : 0, // isGridView에 따라 0 또는 1 설정
//       values: const [0, 1], // 0: 리스트 뷰, 1: 그리드 뷰
//       height: 38,
//       style: ToggleStyle(
//         indicatorColor: mSecondaryColor,
//         backgroundColor: Colors.transparent,
//         borderColor: Colors.transparent,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       onChanged: (i) {
//         setState(() {
//           isGridView = i == 1; // 1일 경우 그리드 뷰로 설정
//         });
//       },
//
//       iconBuilder: (value, foreground) {
//         return rollingIconBuilder(value, foreground); // 아이콘 빌더 호출
//       },
//     );
//   }
// }
//
// Widget rollingIconBuilder(int? value, bool foreground) {
//   return Icon(iconDataByViewType(value)); // value에 따라 아이콘 반환
// }
//
// IconData iconDataByViewType(int? value) => switch (value) {
//       0 => Icons.list, // 리스트 뷰 아이콘
//       1 => Icons.grid_view, // 그리드 뷰 아이콘
// // TODO: Handle this case.
//       int() => throw UnimplementedError(),
// // TODO: Handle this case.
//       null => throw UnimplementedError(),
//     };

/*
*              Switch(
                    value: isGridView,
                    onChanged: (value) {
                      setState(() {
                        isGridView = value; // Update view type
                      });
                    },
                    activeColor: mPrimaryColor,
                    inactiveThumbColor: mGrey3Color,
                    // inactiveTrackColor: Colors.yellow,
                  ),*/

/*
*                   Expanded(
                    child: LiteRollingSwitch(
                      value: isGridView,
                      textOn: '그리드',
                      textOff: '리스트',
                      colorOn: Colors.green,
                      colorOff: Colors.red,
                      iconOn: Icons.grid_view_rounded,
                      iconOff: Icons.list_outlined,
                      textSize: 12.0,
                      onTap: () {
                        print('Current State of SWITCH IS: $isGridView');
                      },
                      onDoubleTap: () {
                        customToastMsg("더블탭");
                      },
                      onSwipe: () {
                        customToastMsg("스와이프");
                      },
                      onChanged: (value) {
                        setState(() {
                          isGridView = value; // Update view type
                        });
                      },
                    ),
                  ),
*/
