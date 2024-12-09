import 'package:atempo_app/controller/music/music_player_controller.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
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
        titleText = '오늘 하루가 평화로웠으면 좋겠어요';
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
              expandedHeight: 230.0, // 확장될 높이
              pinned: true, // 스크롤 시 상단에 고정
              backgroundColor: mPrimaryColor, // 기본 연한 초록색 배경
              title: AnimatedOpacity(
                opacity: innerBoxIsScrolled ? 1.0 : 0.0, // 스크롤 시만 보이도록 설정
                duration: const Duration(milliseconds: 300),
                child: Text(
                  titleText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              centerTitle: false,
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
                        Positioned(
                          bottom: 16,
                          right: 16,
                          child: Text(
                            titleText,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Pretendard",
                                fontSize: 18,
                                color: Colors.white),
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Obx(() {
            return MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: controller.playlist.length, // 전체 리스트의 길이
                itemBuilder: (context, index) {
                  final track = controller.playlist[index]; // 현재 트랙 가져오기
                  return GestureDetector(
                    onTap: () {
                      controller.playTrackAtIndex(index); // 선택한 트랙 재생
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 앨범 커버 이미지
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(track.musicImgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // 제목과 부제목
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    track.musicTitle,
                                    style: TextStyle(
                                      // backgroundColor: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: mPrimaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  _formatDuration(controller.duration.value),
                                  style: TextStyle(
                                    // backgroundColor: Colors.blue,
                                    fontSize: 14,
                                    // fontWeight: FontWeight.bold,
                                    color: mPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}

String _formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$minutes:$seconds";
}
