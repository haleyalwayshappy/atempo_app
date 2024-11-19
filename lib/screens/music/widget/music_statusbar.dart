import 'package:atempo_app/controller/music/music_player_controller.dart';
import 'package:atempo_app/screens/music/music_play_screen.dart';
import 'package:atempo_app/screens/music/music_play_screen2.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MusicStatusBar extends StatelessWidget {
  const MusicStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    // MusicPlayerController를 찾음
    final musicPlayerController = Get.find<MusicPlayerController>();

    return GestureDetector(
      onTap: () {
        // context.go("/music_player");
        // 스테이터스 바  전체를 누르면 음악 재생 화면으로 이동

        showModalBottomSheet(
          isScrollControlled: true,
          barrierColor: mPrimaryColor,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.95,
              child: MusicPlayScreen2(),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: mSadColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: mSadColor.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        height: 60,
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
        child: Obx(() {
          return Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.waves,
                  color: mFontLightColor,
                ),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {},
              ),
              Expanded(
                // 타이틀 제목
                child: Text(
                  musicPlayerController.currentTrackTitle.value,
                  style: TextStyle(
                    color: mFontLightColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.skip_previous_rounded,
                  color: mFontLightColor,
                ),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  musicPlayerController.previousTrack();
                },
              ),
              IconButton(
                icon: Icon(
                  musicPlayerController.isPlaying.value
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  color: mFontLightColor,
                ),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  musicPlayerController.playPause();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.skip_next_rounded,
                  color: mFontLightColor,
                ),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  musicPlayerController.nextTrack();
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
