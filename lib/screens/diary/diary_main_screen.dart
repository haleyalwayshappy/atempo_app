import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:atempo_app/screens/diary/diary_grid_widget.dart';
import 'package:atempo_app/screens/diary/diary_list_widget.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/custom_app_bar.dart';
import 'package:atempo_app/widgets/emotion_popup_widget.dart';
import 'package:atempo_app/widgets/switch_widget.dart';
import 'package:atempo_app/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

/// 일기 홈 화면
class DiaryMainScreen extends StatefulWidget {
  const DiaryMainScreen({super.key});

  @override
  State<DiaryMainScreen> createState() => _DiaryMainScreenState();
}

class _DiaryMainScreenState extends State<DiaryMainScreen> {
  bool isGridView = true; // State variable to track view type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: '일기',
        // showBackButton: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmotionPopupWidget(),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: outlinedDouble),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back_ios_new_outlined)),
                      Text(
                        "2024년 10월",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: mFontDarkColor,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                  AnimatedToggleSwitch<int>.rolling(
                    current: isGridView ? 1 : 0, // isGridView에 따라 0 또는 1 설정
                    values: const [0, 1], // 0: 리스트 뷰, 1: 그리드 뷰
                    height: 38,
                    style: ToggleStyle(
                      indicatorColor: mSecondaryColor,
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onChanged: (i) {
                      setState(() {
                        isGridView = i == 1; // 1일 경우 그리드 뷰로 설정
                      });
                    },

                    iconBuilder: (value, foreground) {
                      return rollingIconBuilder(value, foreground); // 아이콘 빌더 호출
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: isGridView
                  ? DiaryGridWidget() // Render Grid View
                  : DiaryListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget rollingIconBuilder(int? value, bool foreground) {
  return Icon(iconDataByViewType(value)); // value에 따라 아이콘 반환
}

IconData iconDataByViewType(int? value) => switch (value) {
      0 => Icons.list, // 리스트 뷰 아이콘
      1 => Icons.grid_view, // 그리드 뷰 아이콘
      // TODO: Handle this case.
      int() => throw UnimplementedError(),
      // TODO: Handle this case.
      null => throw UnimplementedError(),
    };

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
