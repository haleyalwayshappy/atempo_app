import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarWidget extends StatefulWidget {
  const CustomCalendarWidget(BuildContext context, {super.key});

  @override
  State<CustomCalendarWidget> createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget> {
  final DiaryController _controller = Get.find<DiaryController>();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  /// 선택된 날짜의 첫 번째 일기 데이터를 가져오는 메서드
  Diary? _getDiaryEntryForDate(DateTime date) {
    return _controller.diaryList
        .where((entry) =>
            entry.dateTime.year == date.year &&
            entry.dateTime.month == date.month &&
            entry.dateTime.day == date.day)
        .firstOrNull; // 조건에 맞는 첫 번째 항목만 반환
  }

  /// MainEmotion에 맞는 gridImageUrl 가져오기
  String? _getImageForEmotion(MainEmotion mainEmotion) {
    return mainEmotions
        .firstWhereOrNull((emotion) => emotion.mainEmotion == mainEmotion)
        ?.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDate,
          selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
          calendarFormat: _calendarFormat,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDate = selectedDay; // 선택된 날짜 업데이트
              _focusedDate = focusedDay; // 포커스된 날짜 업데이트
            });
          },
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format; // 달력 형식 업데이트
            });
          },
          onPageChanged: (focusedDay) {
            _focusedDate = focusedDay; // 달력 페이지 변경 시 포커스된 날짜 업데이트
          },
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: const Icon(Icons.chevron_left),
            rightChevronIcon: const Icon(Icons.chevron_right),
            titleTextFormatter: (date, locale) =>
                '${date.year}년 ${date.month}월',
          ),
          calendarBuilders: CalendarBuilders(
            // 기본 날짜
            defaultBuilder: (context, date, focusedDay) {
              return Obx(() {
                final diaryEntry =
                    _getDiaryEntryForDate(date); // 첫 번째 다이어리 가져오기
                final imageUrl = diaryEntry != null
                    ? _getImageForEmotion(diaryEntry.mainEmotion)
                    : null;

                return Container(
                  margin: const EdgeInsets.all(6.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Text(
                          '${date.day}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      if (imageUrl != null)
                        Positioned(
                          bottom: 4,
                          child: Image.asset(
                            imageUrl,
                            width: 36,
                          ),
                        ),
                    ],
                  ),
                );
              });
            },

            // 오늘 날짜
            todayBuilder: (context, date, focusedDay) {
              return Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(color: mPrimaryColor, width: 2),
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: const TextStyle(
                      color: mPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },

            // 선택된 날짜
            selectedBuilder: (context, date, focusedDay) {
              final diaryEntry = _getDiaryEntryForDate(date);

              return GestureDetector(
                onTap: () {
                  if (diaryEntry != null) {
                    context.go('/read/${diaryEntry.diaryId}');
                  } else {
                    customToastMsg("작성된 내용이 없습니다.");
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: mPrimaryColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
