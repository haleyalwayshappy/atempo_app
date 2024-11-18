import 'package:atempo_app/controller/music/music_player_controller.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:atempo_app/screens/music/widget/music_box_widget.dart';
import 'package:get/get.dart';

class MusicListScreen extends StatelessWidget {
  final String pathName;

  const MusicListScreen({
    super.key,
    required this.pathName,
  });

  @override
  Widget build(BuildContext context) {
    // Controller를 GetX로 주입
    final MusicPlayerController controller = Get.put(MusicPlayerController());

    String titleText;

    // pathName에 따른 titleText 설정
    switch (pathName) {
      case 'music1':
        titleText = '기분이 좋을땐 이 노래 들어요';
        break;
      case 'music2':
        titleText = 'Music 2';
        break;
      case 'music3':
        titleText = 'Music 3';
        break;
      case 'audiobook1':
        titleText = 'Audiobook 1';
        break;
      case 'audiobook2':
        titleText = 'Audiobook 2';
        break;
      case 'audiobook3':
        titleText = 'Audiobook 3';
        break;
      default:
        titleText = 'Default Title';
        break;
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 250.0, // 확장될 높이
              pinned: true, // 스크롤 시 상단에 고정
              backgroundColor: mPrimaryColor, // 기본 연한 초록색 배경
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // 스크롤에 따른 색상 변화 비율 계산
                  final appBarHeight = constraints.biggest.height;
                  final t = (appBarHeight - kToolbarHeight) / 250.0; // 색상 변화 비율
                  final appBarColor = ColorTween(
                    begin: Colors.transparent, // 확장 시 투명
                    end: mPrimaryColor.withOpacity(0.5), // 축소 시 연한 초록색
                  ).lerp(1 - t); // 비율을 반대로 적용

                  return FlexibleSpaceBar(
                    title: Text(
                      titleText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pretendard",
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    centerTitle: false,
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/music_bg4.png', // 이미지 경로
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView(
            children: [
              MusicBoxWidget(
                musicTitle: "드라이브하다가 만난 염소",
                musicSubTitle: '기분 좋을때 듣는 음악',
                musicImage: 'image_back3.jpg',
                musicTimeStamp: '2:30',
              ),
              MusicBoxWidget(
                musicTitle: "잠자는 고양이의 배를 만졌을 때",
                musicSubTitle: '기분 좋을때 듣는 음악',
                musicImage: 'image_back4.jpg',
                musicTimeStamp: '2:30',
              ),
              MusicBoxWidget(
                musicTitle: "낮잠자고 일어났을 때",
                musicSubTitle: '기분 좋을때 듣는 음악',
                musicImage: 'image_back.jpg',
                musicTimeStamp: '2:30',
              ),
              MusicBoxWidget(
                musicTitle: "할머니가 건네주시는 따뜻한 고구마",
                musicSubTitle: '기분 좋을때 듣는 음악',
                musicImage: 'music_bg2.png',
                musicTimeStamp: '2:30',
              ),
              MusicBoxWidget(
                musicTitle: "말없이 품에 안기는 너",
                musicSubTitle: '기분 좋을때 듣는 음악',
                musicImage: 'image_back3.jpg',
                musicTimeStamp: '2:30',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
