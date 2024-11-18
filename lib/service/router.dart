// GoRouter 설정
import 'package:atempo_app/screens/account/create_account_screen.dart';
import 'package:atempo_app/screens/account/login_email_screen.dart';
import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/diary/choose_emotion_screen.dart';
import 'package:atempo_app/screens/diary/diary_main_screen.dart';
import 'package:atempo_app/screens/diary/diary_read_screen.dart';
import 'package:atempo_app/screens/diary/diary_write_screen.dart';
import 'package:atempo_app/screens/diary/widget/diary_write_screen_4.dart';
import 'package:atempo_app/screens/home/choice_emotion_screen.dart';
import 'package:atempo_app/screens/home/home_screen.dart';
import 'package:atempo_app/screens/home/splash_screen.dart';
import 'package:atempo_app/screens/music/music_list_screen.dart';
import 'package:atempo_app/screens/music/music_play_screen.dart';
import 'package:atempo_app/screens/music/music_play_screen2.dart';
import 'package:atempo_app/screens/music/music_tab_screen.dart';
import 'package:atempo_app/screens/settings/mypage_screen.dart';
import 'package:atempo_app/screens/widgets/bottom_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  initialLocation: '/music/player',
  // initialLocation: '/login',
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final loggingIn = state.location == '/login';

    // 회원가입과 계정 찾기 경로 예외 처리
    final creatingAccount = state.location == '/create_account';
    final findingAccount = state.location == '/find_account';

    // 로그인되지 않았고, 로그인 페이지가 아니며, 회원가입/계정찾기 경로가 아닌 경우
    if (user == null && !loggingIn && !creatingAccount && !findingAccount) {
      return '/login';
    }

    // 로그인된 상태에서 로그인 페이지에 접근하려는 경우 홈으로 리디렉션
    if (user != null && loggingIn) {
      return '/home';
    }

    // 다른 경우에는 경로 그대로 유지
    return null;
  },
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

                    return MusicPlayScreen2();
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
                  builder: (context, state) => DiaryWriteScreen(),
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
    GoRoute(
      path: '/subEmotion',
      builder: (context, state) => ChooseEmotionScreen(),
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) => DiaryWriteScreen4(),
    ),
  ],
);
