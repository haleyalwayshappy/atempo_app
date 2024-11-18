import 'package:atempo_app/controller/music/music_player_controller.dart';
import 'package:atempo_app/screens/music/music_play_screen.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicStatusBar extends StatelessWidget {
  const MusicStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    // MusicPlayerController를 찾음
    final musicPlayerController = Get.find<MusicPlayerController>();

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.95,
              child: MusicPlayScreen(),
            );
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 아주 슬림한 프로그레스 바 (여백 최소화)
          Obx(() {
            return SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 10.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                trackShape: RectangularSliderTrackShape(),
                activeTrackColor: mPrimaryColor,
                inactiveTrackColor: mGrey5Color,
                thumbColor: Colors.transparent,
              ),
              child: Slider(
                value:
                    musicPlayerController.position.value.inSeconds.toDouble(),
                max: musicPlayerController.duration.value.inSeconds.toDouble(),
                min: 0,
                onChanged: (value) {
                  musicPlayerController
                      .seekTo(Duration(seconds: value.toInt()));
                },
              ),
            );
          }),

          Container(
            height: 60,
            color: Colors.black.withOpacity(0.7),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Obx(() {
                    return Text(
                      musicPlayerController.currentTrackTitle.value,
                      style: TextStyle(
                        color: mFontLightColor,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    );
                  }),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.skip_previous,
                        color: mFontLightColor,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        musicPlayerController.previousTrack();
                      },
                    ),
                    Obx(() {
                      return IconButton(
                        icon: Icon(
                          musicPlayerController.isPlaying.value
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: mFontLightColor,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          musicPlayerController.playPause();
                        },
                      );
                    }),
                    IconButton(
                      icon: Icon(
                        Icons.skip_next,
                        color: mFontLightColor,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        musicPlayerController.nextTrack();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
