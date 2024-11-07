import 'package:atempo_app/screens/music/music_play_screen.dart';
import 'package:atempo_app/controller/music/music_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:atempo_app/utils/constants.dart'; // 상수 불러오기

class MusicStatusBar extends StatelessWidget {
  const MusicStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    // MusicPlayerController를 찾음
    // MusicPlayerController가 처음 사용될 때 주입
    Get.lazyPut<MusicPlayerController>(() => MusicPlayerController());

    return GestureDetector(
      onTap: () {
        // 플레이어 페이지로 이동
        // context.go('/music_player');
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.94, // 화면의 80% 높이로 설정
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
                // 트랙의 높이를 줄여서 슬림하게 설정
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                // Thumb 없애기
                overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                // Overlay 없애기
                trackShape: RectangularSliderTrackShape(),
                // 사각형 트랙 모양
                activeTrackColor: mPrimaryColor,
                // 재생된 부분 색상
                inactiveTrackColor: mGrey5Color,
                // 재생되지 않은 부분 색상
                thumbColor: Colors.transparent, // Thumb 색상 없애기 (보이지 않도록)
              ),
              child: Slider(
                value:
                    MusicPlayerController().position.value.inSeconds.toDouble(),
                max:
                    MusicPlayerController().duration.value.inSeconds.toDouble(),
                min: 0,
                onChanged: (value) {
                  MusicPlayerController()
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
                // 음악 제목 (최대한 축소)
                Expanded(
                  child: Obx(() {
                    return Text(
                      MusicPlayerController().currentSongTitle.value,
                      style: TextStyle(
                        color: mFontLightColor,
                        fontSize: 16, // 글자 크기를 작게 설정
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    );
                  }),
                ),
                Row(
                  children: [
                    // 이전 곡 버튼 (크기 축소)
                    IconButton(
                      icon: Icon(
                        Icons.skip_previous,
                        color: mFontLightColor,
                      ),
                      padding: EdgeInsets.zero, // 기본 패딩 제거
                      constraints: BoxConstraints(), // 기본 제약 조건 제거
                      onPressed: () {
                        MusicPlayerController().previousSong(); // 이전 곡 기능
                      },
                    ),
                    // 재생 / 일시정지 버튼 (크기 축소)
                    Obx(() {
                      return IconButton(
                        icon: Icon(
                          MusicPlayerController().isPlaying.value
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: mFontLightColor,
                        ),
                        padding: EdgeInsets.zero, // 기본 패딩 제거
                        constraints: BoxConstraints(), // 기본 제약 조건 제거
                        onPressed: () {
                          MusicPlayerController().playPause(); // 재생/일시정지 기능
                        },
                      );
                    }),
                    // 다음 곡 버튼 (크기 축소)
                    IconButton(
                      icon: Icon(
                        Icons.skip_next,
                        color: mFontLightColor,
                      ),
                      padding: EdgeInsets.zero, // 기본 패딩 제거
                      constraints: BoxConstraints(), // 기본 제약 조건 제거
                      onPressed: () {
                        MusicPlayerController().nextSong(); // 다음 곡 기능
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
