import 'package:atempo_app/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../components/calendar_widget.dart';

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
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 24.0,
        ),
        title: GestureDetector(
          onTap: () {},
          child: const Text(
            "일기",
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.5,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                size: 28.0,
              ))
        ],
      ),
      backgroundColor: mBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // 감정 상태창
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: mPrimaryColor, width: 4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    child: Image.asset('assets/images/icon_joy.png'),
                  ),
                  Text(
                    "오늘 기분 해피이~!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
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
            ElevatedButton(onPressed: (){}, child: Text("text")),
          ],
        ),
      ),
    );
  }
}
