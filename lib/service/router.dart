// GoRouter 설정
import 'package:atempo_app/screens/account/create_account_screen.dart';
import 'package:atempo_app/screens/account/login_email_screen.dart';
import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/diary/diary_main_screen.dart';
import 'package:atempo_app/screens/diary/diary_read_screen.dart';
import 'package:atempo_app/screens/diary/diary_write_screen.dart';
import 'package:atempo_app/screens/home/choice_emotion_screen.dart';
import 'package:atempo_app/screens/home/home_screen.dart';
import 'package:atempo_app/screens/home/splash_screen.dart';
import 'package:atempo_app/screens/music/music_list_screen.dart';
import 'package:atempo_app/screens/music/music_play_screen.dart';
import 'package:atempo_app/screens/music/music_tab_screen.dart';
import 'package:atempo_app/screens/settings/mypage_screen.dart';
import 'package:atempo_app/screens/widgets/bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _musicNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'music');
final GlobalKey<NavigatorState> _diaryNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'diary');

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, child) => BottomWidget(child: child),
      branches: [
        // Music 탭
        StatefulShellBranch(
          navigatorKey: _musicNavigatorKey,
          routes: [
            GoRoute(
              path: '/music',
              builder: (context, state) {
                final FabController fabController = Get.find();
                fabController.showFab(); // DiaryWriteScreen에서는 FAB를 표시
                return MusicTabScreen();
              }, // MusicTabScreen에서 TabBar 관리
              routes: [
                GoRoute(
                  path: 'list/:pathName',
                  builder: (context, state) {
                    final FabController fabController = Get.find();
                    fabController.showFab(); // DiaryWriteScreen에서는 FAB를 표시
                    final String pathName = state.pathParameters['pathName']!;
                    return MusicListScreen(pathName: pathName);
                  },
                ),
                GoRoute(
                  path: 'player',
                  builder: (context, state) {
                    final FabController fabController = Get.find();

                    // 빌드 완료 후에 hideFab을 호출
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      fabController.hideFab(); // 기본적으로 FAB 숨김
                    });

                    return MusicPlayScreen();
                  },
                ),
              ],
            ),
          ],
        ),
        // Home 탭
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) {
                return HomeScreen();
              },
            ),
          ],
        ),
        // Diary 탭
        StatefulShellBranch(
          navigatorKey: _diaryNavigatorKey,
          routes: [
            GoRoute(
              path: '/diary',
              builder: (context, state) {
                return DiaryMainScreen();
              },
              routes: [
                GoRoute(
                  path: 'read/:diaryId', // diaryId를 경로 파라미터로 전달
                  builder: (context, state) {
                    final diaryId =
                        state.pathParameters['diaryId']!; // 경로에서 diaryId 추출
                    return DiaryReadScreen(diaryId: diaryId); // diaryId를 전달
                  },
                ),
                GoRoute(
                  path: 'write',
                  builder: (context, state) {
                    return DiaryWriteScreen();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    // 로그인, 스플래시, 기타 화면
    GoRoute(
      path: '/login',
      // builder: (context, state) => LoginScreen(),
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/login_email',
      builder: (context, state) => LoginEmailScreen(),
    ),
    GoRoute(
      path: '/create_account',
      builder: (context, state) => CreateAccountScreen(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/choice_emotion',
      builder: (context, state) => ChoiceEmotionScreen(),
    ),
    GoRoute(
      path: '/my_page',
      builder: (context, state) => MyPageScreen(),
    ),
  ],
);
