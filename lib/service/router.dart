// GoRouter 설정
import 'package:atempo_app/screens/account/create_account_screen.dart';
import 'package:atempo_app/screens/account/login_email_screen.dart';
import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/diary/choose_emotion_screen.dart';
import 'package:atempo_app/screens/diary/diary_main_screen.dart';
import 'package:atempo_app/screens/diary/diary_write_screen_4.dart';
import 'package:atempo_app/screens/home/choice_emotion_screen.dart';
import 'package:atempo_app/screens/home/home_screen.dart';
import 'package:atempo_app/screens/home/landing_screen.dart';
import 'package:atempo_app/screens/home/splash_screen.dart';
import 'package:atempo_app/screens/music/music_list_screen.dart';
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
  // initialLocation: '/test',
  initialLocation: '/login',
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;

    // 로그인이 안 된 상태
    if (user == null) {
      final loggingIn = state.location == '/login' ||
          state.location == '/create_account' ||
          state.location == '/find_account';

      // 로그인 중이 아니라면 로그인 화면으로 리디렉션
      if (!loggingIn) {
        print("로그인 화면으로 이동: user가 null입니다.");
        return '/login';
      }
    }

    // 로그인 상태에서 로그인 페이지에 접근 시 홈 화면으로 이동
    if (user != null && state.location == '/login') {
      print("홈 화면으로 이동: user가 로그인 상태입니다.");
      return '/home';
    }

    // 그대로 유지
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
                // return MusicTabScreen();
                return MusicListScreen(pathName: 'music1');
              }, // MusicTabScreen에서 TabBar 관리
              routes: [
                GoRoute(
                  path: 'list/:pathName',
                  builder: (context, state) {
                    final FabController fabController = Get.find();
                    fabController.showFab(); // DiaryWriteScreen에서는 FAB를 표시
                    final String pathName = state.pathParameters['music1']!;
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
                    final diaryId = state.pathParameters['diaryId']!;
                    return DiaryWriteScreen4(
                      isReadOnly: true,
                      diaryId: diaryId,
                    );
                  },
                ),
                GoRoute(
                  path: 'write',
                  builder: (context, state) {
                    return DiaryWriteScreen4(
                      isReadOnly: false,
                    );
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

    //landing Page
    GoRoute(
      path: '/landing',
      builder: (context, state) => LandingScreen(),
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
      path: '/write',
      builder: (context, state) => DiaryWriteScreen4(),
    ),
    GoRoute(
      path: '/read/:diaryId', // diaryId를 경로 파라미터로 전달
      builder: (context, state) {
        final diaryId = state.pathParameters['diaryId']!;
        return DiaryWriteScreen4(
          isReadOnly: true,
          diaryId: diaryId,
        );
      },
    ),
    GoRoute(
      path: '/music_player',
      builder: (context, state) => MusicPlayScreen2(),
    ),
  ],
);
