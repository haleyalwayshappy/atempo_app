import 'package:atempo_app/components/recommend_music_widget.dart';
import 'package:atempo_app/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                height: 80,
                color: Colors.blue,
                child: Text(
                  "홈스크린 띄워라!",
                  style: TextStyle(
                    color: mFontColor,
                  ),
                ),
              ),
              RecommendMusic(),
              // 음악 가로 위젯
            ],
          ),
        ),
      ),
    );
  }
}
