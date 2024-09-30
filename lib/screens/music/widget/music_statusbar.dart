import 'package:flutter/material.dart';

class MusicStatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 음악 제목
          Expanded(
            child: Text(
              'Song Title - Artist',
              style: TextStyle(color: Colors.white, fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous, color: Colors.white),
                onPressed: () {
                  // 이전 곡 기능
                },
              ),
              IconButton(
                icon: Icon(Icons.play_arrow, color: Colors.white),
                onPressed: () {
                  // 재생 / 일시정지 기능
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next, color: Colors.white),
                onPressed: () {
                  // 다음 곡 기능
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
