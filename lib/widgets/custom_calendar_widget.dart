import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarExam extends StatefulWidget {
  const TableCalendarExam({super.key});

  @override
  State<TableCalendarExam> createState() => _TableCalendarExamState();
}

class _TableCalendarExamState extends State<TableCalendarExam> {
  // 달력 보여주는 형식
  CalendarFormat calendarFormat = CalendarFormat.month;

  // 선택된 날짜
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: selectedDate,
        calendarFormat: calendarFormat,
        // onFormatChanged: (format) {
        //   // 달력 형식 변경
        //   // 한 달, 2주, 1주
        //   setState(() {
        //     calendarFormat = format;
        //   });
        // },
        calendarStyle: CalendarStyle(
          // today 색상
          todayTextStyle: TextStyle(color: Colors.transparent),
          todayDecoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/icon/icon_joy_p.png'),
            ),
            // color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(selectedDate, day);
        },
        onDaySelected: (_, focusedDay) {
          setState(() {
            selectedDate = focusedDay;
          });
        },
      ),
    );
  }
}
