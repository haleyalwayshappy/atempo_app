import 'package:atempo_app/model/content_dummydata..dart';
import 'package:atempo_app/screens/music/widget/music_title_text.dart';
import 'package:atempo_app/screens/music/widget/music_box_widget.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/custom_app_bar.dart';
import 'package:atempo_app/widgets/recommend_box.dart';
import 'package:flutter/material.dart';

class MusicMainScreen extends StatelessWidget {
  const MusicMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    // final double itemHeight = screenWidth * 0.2; // Make the height proportional

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MusicTitleText(
            musicTitle: '테마 음악',
            bottom: 0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // 수평 스크롤 설정
            child: Row(
              children: [
                for (var content in dummyContentData)
                  MusicRowWidget(
                    // 중괄호 제거
                    width: 340,
                    height: 200,
                    titleText: content.titleText,
                    subTitleText: content.subTitleText,
                    imageUrl: content.imageUrl,
                  ),
              ],
            ),
          ),

          // 기쁨
          MusicTitleText(
            musicTitle: '춤추고 싶을때',
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: RecommendBox(),
          ),

          // 리스트 예제
          MusicTitleText(
            musicTitle: '리스트 예제',
            bottom: 0,
          ),
          MusicListWidget1(),
        ],
      ),
    );
  }
}

class MusicListWidget1 extends StatelessWidget {
  const MusicListWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          MusicBoxWidget(
              musicTitle: "드라이브하다가 만난 염소",
              musicSubTitle: '기분 좋을때 듣는 음악',
              musicImage: 'image_back2.jpg',
              musicTimeStamp: '2:30'),
          MusicBoxWidget(
              musicTitle: "드라이브하다가 만난 염소",
              musicSubTitle: '기분 좋을때 듣는 음악',
              musicImage: 'image_back2.jpg',
              musicTimeStamp: '2:30'),
          MusicBoxWidget(
              musicTitle: "드라이브하다가 만난 염소",
              musicSubTitle: '기분 좋을때 듣는 음악',
              musicImage: 'image_back2.jpg',
              musicTimeStamp: '2:30'),
          MusicBoxWidget(
              musicTitle: "드라이브하다가 만난 염소",
              musicSubTitle: '기분 좋을때 듣는 음악',
              musicImage: 'image_back2.jpg',
              musicTimeStamp: '2:30'),
        ],
      ),
    );
  }
}

/// 음악 컴포넌트
class MusicRowWidget extends StatelessWidget {
  final double width;
  final double height;
  final String titleText;
  final String subTitleText;
  final String imageUrl;

  const MusicRowWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.titleText,
      required this.subTitleText,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: width,
      height: height,
      child: Stack(
        children: [
          // 배경화면 컨테이너
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/${imageUrl}'),
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

          // 타이틀 내용
          Positioned(
            bottom: 44, // 아래부터 40픽셀
            right: 18, // 오른쪽분터 10픽셀
            child: Text(
              titleText,
              style: TextStyle(
                color: mFontLightColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // 설명
          Positioned(
            bottom: 18, // 아래부터 10픽셀
            right: 18, // 오른쪽부터 10픽셀
            child: Text(
              subTitleText,
              style: TextStyle(
                color: mFontLightColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
