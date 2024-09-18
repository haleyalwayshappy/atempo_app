import 'package:atempo_app/screens/diary/diary_grid_widget.dart';
import 'package:atempo_app/screens/diary/diary_list_widget.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/custom_app_bar.dart';
import 'package:atempo_app/widgets/emotion_popup_widget.dart';
import 'package:flutter/material.dart';

/// 일기 홈 화면
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
      appBar: CustomAppBar(
        titleText: '일기',
        showBackButton: false,
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
              Container(
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
