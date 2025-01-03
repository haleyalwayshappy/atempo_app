import 'package:atempo_app/model/diary_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/screens/diary/widget/diary_grid_widget.dart';
import 'package:atempo_app/screens/diary/diary_list_widget.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

const int listViewIndex = 0;
const int gridViewIndex = 1;

class DiaryMainScreen extends StatefulWidget {
  bool isHide;

  DiaryMainScreen({
    super.key,
    this.isHide = false,
  });

  @override
  State<DiaryMainScreen> createState() => _DiaryMainScreenState();
}

class _DiaryMainScreenState extends State<DiaryMainScreen> {
  final DiaryController _controller = Get.find<DiaryController>();
  bool isGridView = true;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _controller.fetchAllDiariesFromFirebase(); // 데이터 로드
  }

  // 선택된 달과 isShow가 true인 데이터 필터링
  List<Diary> _getDiariesForSelectedMonth() {
    return _controller.diaryList
        .where((diary) =>
            diary.dateTime.year == _selectedDate.year &&
            diary.dateTime.month == _selectedDate.month &&
            diary.isShow == true) // isShow가 true인 항목만 필터링
        .toList();
  }

  List<Diary> _getHideDiariesForSelectedMonth() {
    return _controller.diaryList
        .where((diary) =>
            diary.dateTime.year == _selectedDate.year &&
            diary.dateTime.month == _selectedDate.month &&
            diary.isShow == false) // isShow가 true인 항목만 필터링
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = "${_selectedDate.year}년 ${_selectedDate.month}월";

    return Scaffold(
      appBar: CustomAppBar(
        titleText: widget.isHide ? '숨겨진 일기' : '일기',
        showBackButton: widget.isHide,
        backLocation: '/my_page',
      ),
      body: SafeArea(
        child: Obx(() {
          final filteredDiaries = widget.isHide
              ? _getHideDiariesForSelectedMonth()
              : _getDiariesForSelectedMonth();

          if (_controller.diaryList.isEmpty) {
            return const Center(child: Text("저장된 다이어리가 없습니다. \n 일기를 작성해 주세요"));
          } else if (filteredDiaries.isEmpty) {
            return const Center(
              child: Text("해당 월에는 저장된 일기가 없습니다. \n 일기를 작성해 주세요."),
            );
          }
          return Column(
            children: [
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: outlinedDouble),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // 날짜 선택 모달
                        DateTime tempDate = _controller.dateTime.value;
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SafeArea(
                              child: Container(
                                color: mBackgroundColor,
                                height: 350,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        backgroundColor: mBackgroundColor,
                                        mode: CupertinoDatePickerMode.monthYear,
                                        initialDateTime:
                                            _controller.dateTime.value,
                                        maximumDate: DateTime.now(),
                                        onDateTimeChanged: (value) {
                                          tempDate = value;
                                        },
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _selectedDate = tempDate;
                                          _controller.updateDateTime(tempDate);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text("확인"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Santteut",
                          fontWeight: FontWeight.normal,
                          color: mPrimaryColor,
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
                    ? DiaryGridWidget(diaries: filteredDiaries)
                    : DiaryListWidget(diaries: filteredDiaries),
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
