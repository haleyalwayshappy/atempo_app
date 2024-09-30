// GoRouter 설정
import 'package:atempo_app/screens/account/login_email_screen.dart';
import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/diary/diary_main_screen.dart';
import 'package:atempo_app/screens/diary/diary_read_screen.dart';
import 'package:atempo_app/screens/diary/diary_write_screen.dart';
import 'package:atempo_app/screens/home/choice_emotion_screen.dart';
import 'package:atempo_app/screens/home/home_screen.dart';
import 'package:atempo_app/screens/music/audiobook_screen.dart';
import 'package:atempo_app/screens/music/music_main_screen.dart';
import 'package:atempo_app/widgets/bottom_widget.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/music', // 초기 경로 설정
  routes: [
    /* 바텀네비게이션 영역
    * StatefulShellRoute.indexedStack 에는 builder와 branches가 존재해야한다.
    * branches안에는 'StatefulShellBranch'로 루트를 작성해줘야한다.  */
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => BottomWidget(child: child),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/music',
              // builder: (context, state) => AudiobookScreen(),
              builder: (context, state) => MusicMainScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/diary',
              builder: (context, state) => DiaryMainScreen(),
              routes: [
                // 일기 상세페이지 화면
                GoRoute(
                  path: 'read/:index', // URL 파라미터로 인덱스를 받음
                  builder: (context, state) {
                    var index = int.parse(
                        state.pathParameters['index']!); // URL에서 인덱스 추출
                    print(
                        'Original Index from URL: $index'); // URL에서 추출한 인덱스 출력
                    index = index - 1;
                    return DiaryReadScreen(
                        selectedIndex: index); // 해당 인덱스에 대한 화면 반환
                  },
                ),
                // 일기 쓰기 화면
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

    /* 바텀네비게이션과 같은 레벨단 */
    // 감정 선택 화면
    GoRoute(
      path: '/choice_emotion',
      builder: (context, state) => ChoiceEmotionScreen(),
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
  ],
);

/*
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) => BottomWidget(child: child),
            routes: [
              GoRoute(
                  path: 'music_main',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: MusicMainScreen())),
              GoRoute(
                  path: 'home_main',
                  pageBuilder: (context, state) =>
                      NoTransitionPage(child: HomeScreen())),
              GoRoute(
                  path: 'diary_main',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: DiaryMainScreen())),
            ]),


      ],
    ),
  ],
);*/

//
// final _shellNavigatorKey = GlobalKey<NavigatorState>();
// final GoRouter router = GoRouter(
//   initialLocation: '/home',
//   routes: [
//     // 홈 화면 (바텀네비게이션)
//     GoRoute(
//       path: '/home',
//       builder: (context, state, child) => BottomWidget(child: child),
//       routes: [
//         ShellRoute(
//           navigatorKey: _shellNavigatorKey,
//           builder: (context, state, child) => BottomWidget(child: child),
//           routes: [
//             GoRoute(
//               path: 'home_main',
//               builder: (context, state) => HomeScreen(),
//             ),
//             GoRoute(
//               path: 'diary_main',
//               builder: (context, state) => DiaryMainScreen(),
//             ),
//             GoRoute(
//               path: 'music_main',
//               builder: (context, state) => MusicMainScreen(),
//             ),
//           ],
//         ),
//
//         // 스플래쉬 페이지
//         GoRoute(
//           path: '/',
//           builder: (context, state) => SplashScreen(),
//         ),
//
//         // 로그인 화면
//         GoRoute(
//           path: '/login',
//           builder: (context, state) => LoginScreen(),
//           routes: [
//             GoRoute(
//               path: 'login_email',
//               builder: (context, state) => LoginEmailScreen(),
//             ),
//           ],
//         ),
//         // 이메일 로그인 화면
//
//         // 감정 선택 화면
//         GoRoute(
//           path: '/choice_emotion',
//           builder: (context, state) => ChoiceEmotionScreen(),
//         ),
//         // 일기 상세 화면
//         GoRoute(
//           path: '/diary/:index', // URL 파라미터로 인덱스를 받음
//           builder: (context, state) {
//             var index =
//                 int.parse(state.pathParameters['index']!); // URL에서 인덱스 추출
//             print('Original Index from URL: $index'); // URL에서 추출한 인덱스 출력
//             index = index - 1;
//             return DiaryReadScreen(selectedIndex: index); // 해당 인덱스에 대한 화면 반환
//           },
//         ),
//         // 일기쓰기 화면
//         GoRoute(
//           path: '/diary/write',
//           builder: (context, state) => DiaryWriteScreen(),
//         ),
//       ],
//     ),
//   ],
// );
