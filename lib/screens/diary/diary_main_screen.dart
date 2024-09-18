import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/screens/diary/diary_grid_widget.dart';
import 'package:atempo_app/screens/diary/diary_list_widget.dart';
import 'package:atempo_app/widgets/list_widget.dart';
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
  bool isGridView = true; // State variable to track view type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        title: GestureDetector(
          onTap: () {},
          child: const Text("일기"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: outlinedDouble),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmotionPopupWidget(),
              SizedBox(height: 10),
              Row(
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
                  Switch(
                    value: isGridView,
                    onChanged: (value) {
                      setState(() {
                        isGridView = value; // Update view type
                      });
                    },
                  ),
                ],
              ),
              Expanded(
                child: isGridView
                    ? DiaryGridWidget() // Render Grid View
                    : DiaryListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
