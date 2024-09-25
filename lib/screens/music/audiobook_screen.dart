import 'package:atempo_app/model/music_dummydata.dart';
import 'package:atempo_app/screens/music/music_main_screen.dart';
import 'package:atempo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AudiobookScreen extends StatelessWidget {
  const AudiobookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "오디오북"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: MusicRowWidget(
                  width: 400,
                  height: 0,
                  titleText: "이것만큼은 맹세할게",
                  subTitleText: "내 전부를 다 바칠게"),
            ),
            Expanded(
              flex: 2,
              child: GridView.count(
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 1.5/1,
                // crossAxisSpacing: 10,
                // 간격
                // mainAxisSpacing: 10,
                // 간격
                // 한줄에 5개 (여기서 갯수 조정 가능)
                children: List.generate(8,(index) {
                    return GridToAudioWidget();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridToAudioWidget extends StatelessWidget {
  const GridToAudioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // width: width,
      height: 100,
      child: Stack(
        children: [
          // 이미지 컨테이너
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/day6_bg2.jpeg'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          // 반투명 배경 컨테이너
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Colors.black, // 시작 색상
                  Colors.transparent, // 끝 색상
                ],
                end: Alignment.topCenter, // 그라데이션 시작 위치
                begin: Alignment.bottomCenter, // 그라데이션 끝 위치
              ),
            ),
          ),

          // 첫 번째 텍스트 (크기 24)
          Positioned(
            bottom: 30, // 아래에서 40픽셀
            right: 2, // 오른쪽에서 10픽셀
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 8, vertical: 4),
              // color: Colors.black54, // 반투명 배경
              child: Text(
                "May I be happy?", // 원하는 텍스트
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, // 크기 24
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 두 번째 텍스트 (크기 16)
          Positioned(
            bottom: 10, // 아래에서 10픽셀
            right: 5, // 오른쪽에서 10픽셀
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 8, vertical: 4),
              // color: Colors.black54, // 반투명 배경
              child: Text(
                "happy", // 원하는 텍스트
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // 크기 16
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    ); // 이미지 반환
  }
}
