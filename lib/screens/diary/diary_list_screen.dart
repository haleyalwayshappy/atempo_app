import 'package:flutter/material.dart';

class DiaryListScreen extends StatefulWidget {
  const DiaryListScreen({super.key});

  @override
  State<DiaryListScreen> createState() => _DiaryListScreenState();
}

class _DiaryListScreenState extends State<DiaryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}



/*
*  body: ListView.builder(
        itemCount: dummyDiaryData.length,
        itemBuilder: (context, index) {
          var imagePath;
          switch (dummyDiaryData[index].mainEmotion) {
            case Emotion.joy:
              imagePath = emotions[0].imageUrl;
            case Emotion.sad:
              imagePath = emotions[1].imageUrl;
            case Emotion.anger
              imagePath = emotions[2].imageUrl;
            case Emotion.peace:
              imagePath = emotions[3].imageUrl;
            case Emotion.confused:
              imagePath = emotions[4].imageUrl;
          }

          return ListTile(
            leading: Image.asset(
              imagePath,
              width: 32,
              height: 32,
            ), // 리스트 앞에 위치할 아이콘
            title: Text(dummyDiaryData[index].dateTime), // 메인 텍스트
            onTap: () {
              customToastMsg("리스트 눌렀다.");
            },
          );
        },
      ),
      * */