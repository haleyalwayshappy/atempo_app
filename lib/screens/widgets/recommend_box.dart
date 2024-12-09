import 'package:atempo_app/controller/music/music_player_controller.dart';
import 'package:atempo_app/screens/music/music_play_screen.dart';
import 'package:atempo_app/screens/music/music_play_screen2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:go_router/go_router.dart';

class RecommendBox extends StatelessWidget {
  final MusicPlayerController controller = Get.put(MusicPlayerController());

  RecommendBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // 수평 스크롤 설정
      child: Obx(() {
        return Row(
          children: controller.playlist.take(5).map((track) {
            return GestureDetector(
              onTap: () {
                // 해당 곡의 인덱스 가져오기
                int index = controller.playlist.indexOf(track);
                // 공개 메서드를 호출하여 곡 재생
                controller.playTrackAtIndex(index);

                context.go('/music_player');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 앨범 커버 이미지
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(track.musicImgUrl),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    // 음악 제목
                    Text(
                      track.musicTitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: mPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}
