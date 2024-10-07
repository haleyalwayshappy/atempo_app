import 'package:atempo_app/service/music/music_player_controller.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicPlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Controller를 GetX로 주입
    final MusicPlayerController controller = Get.put(MusicPlayerController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        // 앨범커버
            Obx(() {
              return Container(
                width: 250, // 원하는 크기로 설정
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // 모서리 둥글게
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: controller.albumCoverUrl.value.isNotEmpty
                    ? Image.network(
                        controller.albumCoverUrl.value, // 앨범 커버 URL
                        fit: BoxFit.cover, // 이미지가 꽉 차게
                        errorBuilder: (context, error, stackTrace) {
                          // 이미지 로드 실패 시 대체 이미지
                          return Icon(Icons.album,
                              size: 64, color: Colors.grey);
                        },
                      )
                    : Icon(Icons.album,
                        size: 150, color: Colors.grey), // 기본 아이콘
              );
            }),

            SizedBox(height: 32), // 앨범 커버와 컨트롤러 간 간격

            //재생,일시정지  이전 곡 / 다음 곡 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() {
                  return IconButton(
                    icon: Icon(Icons.skip_previous, size: 48.0),
                    onPressed: controller.hasPrevious.value
                        ? controller.previousSong
                        : null,
                  );
                }),
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
                Obx(() {
                  return IconButton(
                    icon: Icon(Icons.skip_next, size: 48.0),
                    onPressed:
                        controller.hasNext.value ? controller.nextSong : null,
                  );
                }),
              ],
            ),

            // 재생 위치 표시 및 SeekBar
            Obx(() {
              return Column(
                children: [
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
                        '${_formatDuration(controller.position.value)}',
                      ),
                      Text(
                        '${_formatDuration(controller.duration.value)}',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite,size: 36,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.heart_broken_rounded,size: 36),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.dehaze,size: 36),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
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
