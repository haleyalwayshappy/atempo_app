import 'package:atempo_app/screens/music/widget/music_title_text.dart';
import 'package:atempo_app/controller/music/music_player_controller.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MusicPlayScreen2 extends StatelessWidget {
  const MusicPlayScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller를 GetX로 주입
    final MusicPlayerController controller = Get.put(MusicPlayerController());

    return Scaffold(
      backgroundColor: mPrimaryColor,
      appBar: AppBar(
        backgroundColor: mPrimaryColor,
        title: Text("title"),
        leading: Icon(Icons.arrow_back_ios_new_rounded, size: 30.0),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.dehaze_rounded, size: 30.0),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: mBackgroundColor.withOpacity(0.90),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(26), // top 반경 26
                      bottom: Radius.zero, // bottom 반경 0
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 30),

                      /// 앨범커버
                      Container(
                        width: 300, // 원하는 크기로 설정
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  controller.currentTrackCoverUrl.value),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),

                      SizedBox(height: 20), // 앨범 커버와 컨트롤러 간 간격

                      /// 제목, 아티스트, 좋아요, 싫어요
                      MusicTitleText(
                        musicTitle: controller.currentTrackTitle.value,
                        fontSize: 16,
                        left: 0,
                        top: 0,
                        bottom: 0,
                        right: 0,
                      ),
                      SizedBox(
                        height: 8,
                      ),

                      /// 재생 위치 표시 및 SeekBar
                      Column(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 0.0),
                              // Overlay 없애기
                              activeTrackColor: mPrimaryColor,
                              // 재생된 부분 색상
                              inactiveTrackColor: Colors.grey,
                              // 재생되지 않은 부분 색상
                              thumbColor:
                                  mPrimaryColor, // Thumb 색상 없애기 (보이지 않도록)
                            ),
                            child: Slider(
                              value: controller.position.value.inSeconds
                                  .toDouble(),
                              max: controller.duration.value.inSeconds
                                  .toDouble(),
                              onChanged: (value) {
                                controller
                                    .seekTo(Duration(seconds: value.toInt()));
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _formatDuration(controller.position.value),
                              ),
                              Text(
                                _formatDuration(controller.duration.value),
                                // controller.duration.value as String,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),

                      ///재생,일시정지  이전 곡 / 다음 곡 버튼
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /// 랜덤 재생 아이콘

                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.random, size: 28),
                            onPressed: () {},
                            // controller.hasShuffle.value
                            //     ? controller.shuffleSong
                            //     : null,
                          ),

                          /// 이전곡 아이콘
                          IconButton(
                            icon: Icon(Icons.skip_previous, size: 48.0),
                            onPressed: controller.hasPrevious.value
                                ? controller.previousTrack
                                : null,
                          ),

                          /// 재생&정지 아이콘
                          IconButton(
                            icon: Icon(
                              controller.isPlaying.value
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 64.0,
                            ),
                            onPressed: controller.playPause,
                          ),

                          /// 다음곡 버튼
                          IconButton(
                            icon: Icon(Icons.skip_next, size: 48.0),
                            onPressed: controller.hasNext.value
                                ? controller.nextTrack
                                : null,
                          ),

                          /// 목록 버튼
                          IconButton(
                            icon: Icon(Icons.dehaze_rounded, size: 34.0),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
