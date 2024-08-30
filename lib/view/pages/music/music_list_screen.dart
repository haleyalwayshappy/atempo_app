import 'package:flutter/material.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("test"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // 팝업 페이지를 띄워주고, 뒤로가기 버튼에서
                },
                child: Text("text")),
          ],
        ),
      ),
    );
  }
}
