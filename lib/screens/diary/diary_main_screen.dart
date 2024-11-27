import 'package:flutter/material.dart';
import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/diary/widget/diary_grid_widget.dart';
import 'package:atempo_app/screens/diary/diary_list_widget.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:get/get.dart';

const int listViewIndex = 0;
const int gridViewIndex = 1;

class DiaryMainScreen extends StatefulWidget {
  const DiaryMainScreen({super.key});

  @override
  State<DiaryMainScreen> createState() => _DiaryMainScreenState();
}

class _DiaryMainScreenState extends State<DiaryMainScreen> {
  final DiaryController _controller = Get.find<DiaryController>();
  bool isGridView = false;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _controller.fetchAllDiariesFromFirebase(); // 데이터 로드
  }

  // 데이트 피커 호출
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2010, 1),
      lastDate: DateTime(2030, 12),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
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
        child: Obx(() {
          if (_controller.diaryList.isEmpty) {
            return Center(child: Text("저장된 다이어리가 없습니다."));
          }

          return Column(
            children: [
              // 감정 팝업
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: outlinedDouble),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Text(
                        "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}",
                        style: const TextStyle(
                          color: mPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    AnimatedToggleSwitch<int>.rolling(
                      current: isGridView ? gridViewIndex : listViewIndex,
                      values: const [listViewIndex, gridViewIndex],
                      height: 38,
                      style: ToggleStyle(
                        indicatorColor: mSecondaryColor,
                        borderColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        indicatorBorderRadius: BorderRadius.circular(50),
                      ),
                      onChanged: (index) {
                        setState(() {
                          isGridView = index == gridViewIndex;
                        });
                      },
                      iconBuilder: (value, foreground) {
                        return Icon(iconDataByViewType(value),
                            color: foreground ? mPrimaryColor : Colors.grey);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: isGridView
                    ? DiaryGridWidget(diaries: _controller.diaryList.toList())
                    : DiaryListWidget(diaries: _controller.diaryList.toList()),
              ),
            ],
          );
        }),
      ),
    );
  }
}

IconData iconDataByViewType(int? value) => switch (value) {
      0 => Icons.list,
      1 => Icons.grid_view,
      _ => Icons.error,
    };
