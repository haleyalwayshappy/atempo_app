import 'package:animated_music_indicator/animated_music_indicator.dart';
import 'package:atempo_app/controller/music/music_player_controller.dart';
import 'package:atempo_app/screens/music/music_play_screen2.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicStatusBar extends StatelessWidget {
  const MusicStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();

    return GestureDetector(
      onTap: () {
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
          color: mPrimaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: mPrimaryColor.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        height: 60,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
        child: Obx(() {
          return Row(
            children: [
              if (musicPlayerController.isPlaying.value)
                AnimatedMusicIndicator(
                  numberOfBars: 5,
                  size: 0.06,
                  barStyle: BarStyle.circle,
                  roundBars: false,
                  colors: const [
                    mFontLightColor,
                    mFontLightColor,
                    mFontLightColor,
                    mFontLightColor,
                    mFontLightColor,
                  ],
                )
              else
                Icon(
                  Icons.music_note_rounded,
                  color: mFontLightColor,
                ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  musicPlayerController.currentTrackTitle.value,
                  style: const TextStyle(
                    color: mFontLightColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.skip_previous_rounded,
                  color: mFontLightColor,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
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
                constraints: const BoxConstraints(),
                onPressed: () {
                  musicPlayerController.playPause();
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.skip_next_rounded,
                  color: mFontLightColor,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  musicPlayerController.nextTrack();
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
