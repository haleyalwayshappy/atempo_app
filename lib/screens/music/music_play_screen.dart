import 'package:atempo_app/screens/music/widget/music_title_text.dart';
import 'package:atempo_app/controller/music/music_player_controller.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MusicPlayScreen extends StatelessWidget {
  const MusicPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller를 GetX로 주입
    final MusicPlayerController controller = Get.put(MusicPlayerController());

    return Container(
      decoration: BoxDecoration(
        color: mLightGreenColor.withOpacity(0.18),
        borderRadius: BorderRadius.circular(26),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),

            /// 앨범커버
            Container(
              width: 300, // 원하는 크기로 설정
              height: 300,
              decoration: BoxDecoration(
                color: mLightGreenColor.withOpacity(0.18),
                borderRadius: BorderRadius.circular(26),
              ),
              child: controller.currentTrackCoverUrl.value.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                        color: mLightGreenColor.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Image.network(
                        controller.currentTrackCoverUrl.value, // 앨범 커버 URL
                        // fit: BoxFit.cover, // 이미지가 꽉 차게
                        errorBuilder: (context, error, stackTrace) {
                          // 이미지 로드 실패 시 대체 이미지
                          return Image.asset(
                              controller.currentTrackCoverUrl.value);
                        },
                      ),
                    )
                  : Icon(Icons.album, size: 150, color: Colors.grey), // 기본 아이콘
            ),

            SizedBox(height: 20), // 앨범 커버와 컨트롤러 간 간격

            /// 제목, 아티스트, 좋아요, 싫어요
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 제목 & 아티스트
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    MusicTitleText(
                      musicTitle: "아티스트",
                      fontSize: 14,
                      left: 0,
                      top: 0,
                      bottom: 0,
                      right: 0,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                // 좋아요 & 싫어요
                Row(
                  ///TODO : 좋아요 또는 싫어요만 가능하다.
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// 좋아요
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.thumb_up_alt_outlined,
                        size: 32,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    /// 싫어요
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.thumb_down_alt_outlined,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            /// 재생 위치 표시 및 SeekBar
            Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                    // Overlay 없애기
                    activeTrackColor: mPrimaryColor,
                    // 재생된 부분 색상
                    inactiveTrackColor: Colors.grey,
                    // 재생되지 않은 부분 색상
                    thumbColor: mPrimaryColor, // Thumb 색상 없애기 (보이지 않도록)
                  ),
                  child: Slider(
                    value: controller.position.value.inSeconds.toDouble(),
                    max: controller.duration.value.inSeconds.toDouble(),
                    onChanged: (value) {
                      controller.seekTo(Duration(seconds: value.toInt()));
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
                Obx(() {
                  return IconButton(
                    icon: Icon(
                      controller.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 64.0,
                    ),
                    onPressed: controller.playPause,
                  );
                }),

                /// 다음곡 버튼
                IconButton(
                  icon: Icon(Icons.skip_next, size: 48.0),
                  onPressed:
                      controller.hasNext.value ? controller.nextTrack : null,
                ),

                /// 목록 버튼
                IconButton(
                  icon: Icon(Icons.dehaze_rounded, size: 34.0),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
