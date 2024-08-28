import 'package:atempo_app/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../components/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wBackgroundColor,
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
                color: Colors.yellowAccent,
                child: Text(
                  "홈스크린 띄워라!",
                  style: TextStyle(
                    color: wFontColor,
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

class RecommendMusic extends StatelessWidget {
  const RecommendMusic({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> musicItems = [
      // index : "1" , image: "
      {
        'index': '1',
        'image': 'assets/images/maru_image.png',
        'text': 'Musssssic 1'
      },
      {
        'index': '2',
        'image': 'assets/images/maru_image.png',
        'text': 'Music 2'
      },
      {
        'index': '3',
        'image': 'assets/images/maru_image.png',
        'text': 'Music 3'
      },
      {
        'index': '4',
        'image': 'assets/images/maru_image.png',
        'text': 'Music 4'
      },
      {
        'index': '5',
        'image': 'assets/images/maru_image.png',
        'text': 'Music 5'
      },
    ];

    return Container(
      // color: Colors.purple,
      width: double.infinity,
      height: 500,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: musicItems.length,
        itemBuilder: (context, idx) {
          var imageRoute = musicItems[idx]['image'];
          var musicTexts = musicItems[idx]['text'];
          return SizedBox(
            height: 100,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      imageRoute!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    musicTexts!,
                    style: TextStyle(color: wFontColor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
