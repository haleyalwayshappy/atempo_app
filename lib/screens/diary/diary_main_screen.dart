import 'package:atempo_app/widgets/emotion_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/constants.dart';

class DiaryMainScreen extends StatefulWidget {
  const DiaryMainScreen({super.key});

  @override
  State<DiaryMainScreen> createState() => _DiaryMainScreenState();
}

class _DiaryMainScreenState extends State<DiaryMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // 앱바 - 일기 텍스트 화면
        title: GestureDetector(
          onTap: () {},
          child: const Text(
            "일기",
          ),
        ),

        // 마이페이지 아이콘
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // 감정 상태창
              // EmotionPopupWidget(),
              // row > datepicker / 우측에 화면 전환
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                    Text(
                      "2024년 10월",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.list_outlined,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),

              // CalendarWidget(
              //   title: '달력',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
