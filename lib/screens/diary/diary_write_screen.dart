import 'package:atempo_app/model/diary_data.dart';
import 'package:flutter/material.dart';

class DiaryWriteScreen extends StatefulWidget {
  DiaryWriteScreen({super.key});

  @override
  State<DiaryWriteScreen> createState() => _DiaryWriteScreenState();
}

class _DiaryWriteScreenState extends State<DiaryWriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("하이"),
        ),
      ),
    );
  }
}
