import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/emotion_popup_widget.dart';
import 'package:atempo_app/widgets/recommend_music.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmotionPopupWidget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      "추천콘텐츠",
                      style: TextStyle(
                        fontSize: 20,
                        color: mSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RecommendMusic(),
                  // TODO 달력 구현하기
                ],
              ),
              // 음악 가로 위젯
            ],
          ),
        ),
      ),
    );
  }
}
