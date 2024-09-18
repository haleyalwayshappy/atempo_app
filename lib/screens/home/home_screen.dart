import 'package:atempo_app/model/music_dummydata.dart';
import 'package:atempo_app/widgets/custom_calendar_widget.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/emotion_popup_widget.dart';
import 'package:atempo_app/widgets/recommend_box.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Image.asset('assets/images/logo_atempo.png', width: 160),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
              ))
        ],
      ),
      backgroundColor: mBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(outlinedDouble),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmotionPopupWidget(),
              // 음악 가로 위젯
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "추천콘텐츠",
                  style: TextStyle(
                    fontSize: 16,
                    color: mSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // TODO 달력 구현하기
              RecommendBox(),
              SizedBox(
                height: 20,
              ),
              TableCalendarExam(),
            ],
          ),
        ),
      ),
    );
  }
}
