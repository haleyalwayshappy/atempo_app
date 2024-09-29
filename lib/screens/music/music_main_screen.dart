import 'package:atempo_app/model/content_dummydata..dart';
import 'package:atempo_app/screens/music/music_theme_title.dart';
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

    return Scaffold(
      appBar: CustomAppBar(titleText: "음악"),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MusicThemeTitle(
                musicTitle: '테마 음악',
                top: 0.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 수평 스크롤 설정
                child: Row(
                  children: [
                 for(var content in dummyContentData)
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
              MusicThemeTitle(
                musicTitle: '춤추고 싶을때',
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: RecommendBox(),
              ),

              // 리스트 예제
              MusicThemeTitle(
                musicTitle: '리스트 예제',
                bottom: 0,
              ),
              MusicListWidget1(),



            ],
          ),
        ),
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
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // 컨테이너 안에 데코레이션 박스에 이미지 넣음
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/maru1.jpeg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.blue,
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '맛있는 음식을 먹은 마루',
                          style: TextStyle(
                            fontSize: 14,
                            color: mPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '기분 좋을때 듣는 음악',
                          style: TextStyle(
                            fontSize: 12,
                            color: mSecondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    '3:40',
                    style: TextStyle(
                      fontSize: 14,
                      color: mPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
      required this.subTitleText, required this.imageUrl});

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
