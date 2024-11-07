import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarWidget extends StatefulWidget {
  const CustomCalendarWidget({super.key});

  @override
  State<CustomCalendarWidget> createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget> {
  // 달력 보여주는 형식
  CalendarFormat calendarFormat = CalendarFormat.month;
  // 선택된 날짜
  DateTime selectedDate = DateTime.now();
  DateTime focusedDay = DateTime.now();

  // 선택된 날짜에 해당하는 일기 데이터를 가져오는 메서드
  Diary? getDiaryEntryForSelectedDate(DateTime date) {
    for (var entry in dummyDiaryData) {
      // print("날짜 쳌 ${entry.dateTime}");
      if (entry.dateTime.year == date.year &&
          entry.dateTime.month == date.month &&
          entry.dateTime.day == date.day) {
        return entry; // 일기 데이터 반환
      }
    }
    return null; // 일기 데이터가 없을 경우 null 반환
  }

  // 선택된 감정에 맞는 이미지를 가져오는 메서드
  String? getImageForEmotion(MainEmotion mainEmotion) {
    for (var emotion in mainEmotions) {
      if (emotion.mainEmotion == mainEmotion) {
        return emotion.gridImageUrl; // 감정에 맞는 이미지 경로 반환
        // return emotion.imageUrl; // 감정에 맞는 이미지 경로 반환
      }
    }
    return null; // 감정에 맞는 이미지가 없을 경우 null 반환
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: selectedDate,
          selectedDayPredicate: (day) {
            return isSameDay(selectedDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selectedDate = selectedDay; // 선택된 날짜 업데이트
              this.focusedDay = focusedDay; // 포커스된 날짜 업데이트
            });
          },

          headerStyle: HeaderStyle(
            formatButtonVisible: false, // 형식 버튼 숨기기
            titleCentered: true, // 제목 중앙 정렬
            leftChevronIcon: Icon(Icons.chevron_left), // 왼쪽 화살표 아이콘
            rightChevronIcon: Icon(Icons.chevron_right), // 오른쪽 화살표 아이콘
            titleTextFormatter: (date, locale) {
              return '${date.year}년 ${date.month}월'; // 헤더 제목 형식
            },
          ),

          // 날짜 셀을 커스터마이즈
          calendarBuilders: CalendarBuilders(
            // 기본 날짜 세팅
            defaultBuilder: (context, date, focusedDay) {
              final diaryEntry = getDiaryEntryForSelectedDate(date);
              final imageUrl = diaryEntry != null
                  ? getImageForEmotion(diaryEntry.mainEmotion)
                  : null;

              return Container(
                margin: EdgeInsets.all(6.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(child: Text('${date.day}')),
                    if (imageUrl != null)
                      Positioned(
                        bottom: 4,
                        child: Image.asset(
                          imageUrl,
                          width: 36, // 아이콘 크기 조정
                        ),
                      ),
                  ],
                ),
              );
            },

            // 오늘 날짜 커스텀
            todayBuilder: (context, date, focusedDay) {
              return Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(color: mPrimaryColor, width: 2),
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: TextStyle(
                      color: mPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ), // 오늘 날짜 텍스트 색상
                  ),
                ),
              );
            },

            // 선택된 날짜
            selectedBuilder: (context, date, focusedDay) {
              final diaryEntry = getDiaryEntryForSelectedDate(date);

              return GestureDetector(
                onTap: () {
                  if (diaryEntry != null) {
                    context.go('/diary/read/${diaryEntry.diaryId}');
                  } else {
                    customToastMsg("작성된 내용이 없습니다.");
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: mPrimaryColor, // 선택된 날짜 배경색
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ), // 선택된 날짜 텍스트 색상
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
