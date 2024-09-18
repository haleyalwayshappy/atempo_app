import 'package:atempo_app/screens/account/login_email_screen.dart';
import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/diary/diary_read_screen.dart';
import 'package:atempo_app/screens/home/choice_emotion_screen.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MainScreenApp());

class MainScreenApp extends StatelessWidget {
  MainScreenApp({Key? key}) : super(key: key);

  // GoRouter 설정
  final GoRouter _router = GoRouter(
    routes: [
      // 홈 화면 (바텀네비게이션)
      GoRoute(
        path: '/',
        builder: (context, state) => BottomWidget(),
      ),

      // 로그인 화면
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      // 이메일 로그인 화면
      GoRoute(
        path: '/login_email',
        builder: (context, state) => LoginEmailScreen(),
      ),
      // 감정 선택 화면
      GoRoute(
        path: '/choice_emotion',
        builder: (context, state) => ChoiceEmotionScreen(),
      ),
      GoRoute(
        path: '/diary/:index', // URL 파라미터로 인덱스를 받음
        builder: (context, state) {
          final index =
              int.parse(state.pathParameters['index']!); // URL에서 인덱스 추출
          return DiaryReadScreen(selectedIndex: index); // 해당 인덱스에 대한 화면 반환
        },
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: mEnabledColor,
            size: 32,
          ),
          backgroundColor: mBackgroundColor,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: mFontDarkColor,
            fontSize: 24,
            fontWeight: FontWeight.w800,
            letterSpacing: 4.0,
          ),
        ),
        scaffoldBackgroundColor: mBackgroundColor,
      ),
    );
  }
}
