import 'package:flutter/material.dart';
import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/widgets/emotion_popup_widget.dart';
import 'package:atempo_app/screens/diary/widget/diary_grid_widget.dart';
import 'package:atempo_app/screens/diary/diary_list_widget.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:atempo_app/utils/constants.dart';

const int listViewIndex = 0;
const int gridViewIndex = 1;

/// 일기 홈 화면
class DiaryMainScreen extends StatefulWidget {
  const DiaryMainScreen({super.key});

  @override
  State<DiaryMainScreen> createState() => _DiaryMainScreenState();
}

class _DiaryMainScreenState extends State<DiaryMainScreen> {
  bool isGridView = false;
  DateTime _selectedDate = DateTime.now(); // Store selected date

  // 데이트 피커 호출하는 메서드
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2010, 1), // 선택할 수 있는 가장 이른 날짜
      lastDate: DateTime(2030, 12), // 선택할 수 있는 가장 늦은 날짜
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked; // Update selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: '일기',
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
                  GestureDetector(
                    onTap: () => _selectDate(context), // 버튼 클릭 시 데이트 피커 호출
                    child: Text(
                      "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}",
                      style: TextStyle(
                        color: mPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AnimatedToggleSwitch<int>.rolling(
                    current: isGridView
                        ? gridViewIndex
                        : listViewIndex, // isGridView에 따라 0 또는 1 설정
                    values: const [
                      listViewIndex,
                      gridViewIndex
                    ], // 0: 리스트 뷰, 1: 그리드 뷰
                    height: 38,
                    style: ToggleStyle(
                      indicatorColor: mSecondaryColor,
                      borderColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      indicatorBorderRadius: BorderRadius.circular(50),
                    ),
                    onChanged: (index) {
                      setState(() {
                        isGridView = index == gridViewIndex; // index에 따라 상태 설정
                      });
                    },
                    iconBuilder: (value, foreground) {
                      return rollingIconBuilder(value, foreground);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: isGridView
                  ? DiaryGridWidget() // Render Grid View
                  : DiaryListWidget(), // Render List View
            ),
          ],
        ),
      ),
    );
  }
}

Widget rollingIconBuilder(int? value, bool foreground) {
  return Icon(iconDataByViewType(value),
      color: foreground ? mPrimaryColor : Colors.grey);
}

IconData iconDataByViewType(int? value) => switch (value) {
      0 => Icons.list, // 리스트 뷰 아이콘
      1 => Icons.grid_view, // 그리드 뷰 아이콘
      _ => Icons.error,
    };
