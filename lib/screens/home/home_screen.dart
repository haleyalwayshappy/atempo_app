import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/screens/widgets/custom_calendar_widget.dart';
import 'package:atempo_app/screens/widgets/recommend_box.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final DiaryController _controller = Get.find<DiaryController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("화면 구성 쳌");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Image.asset(
          height: 36,
          'assets/images/logo_atempo.png',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              context.go('/my_page');
              //마이페이지 이동
            },
          ),
        ],
      ),
      backgroundColor: mBackgroundColor,
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(outlinedDouble),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: double.infinity,
            //   padding: EdgeInsets.symmetric(vertical: 80),
            //   child: Image.asset('assets/images/emotions.png'),
            // ),

            // EmotionPopupWidget(),
            // 음악 가로 위젯
            Container(
              // color: Colors.blue,
              padding: const EdgeInsets.only(top: 16.0, bottom: 8, left: 28),
              child: Text(
                "추천콘텐츠",
                style: TextStyle(
                  fontSize: 16,
                  color: mPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            /* 추천 컨테이너 */
            Container(
              margin: EdgeInsets.only(left: 18, bottom: 16),
              child: RecommendBox(),
            ),

            /* 달력 화면 */
            Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(left: 12, right: 12),
              child: CustomCalendarWidget(context),
            ),
          ],
        ),
      ),
    );
  }
}
