// GoRouter 설정
import 'package:atempo_app/screens/account/login_email_screen.dart';
import 'package:atempo_app/screens/account/login_screen.dart';
import 'package:atempo_app/screens/diary/diary_main_screen.dart';
import 'package:atempo_app/screens/diary/diary_read_screen.dart';
import 'package:atempo_app/screens/diary/diary_write_screen.dart';
import 'package:atempo_app/screens/home/choice_emotion_screen.dart';
import 'package:atempo_app/screens/home/home_screen.dart';
import 'package:atempo_app/screens/home/splash_screen.dart';
import 'package:atempo_app/screens/music/audiobook_screen.dart';
import 'package:atempo_app/screens/music/music_list_screen.dart';
import 'package:atempo_app/screens/music/music_screen.dart';
import 'package:atempo_app/screens/music/music_tab_screen.dart';
import 'package:atempo_app/widgets/bottom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatiorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  initialLocation: '/home', // 초기 경로 설정
  routes: [
    /* 바텀네비게이션 영역
    * StatefulShellRoute.indexedStack 에는 builder와 branches가 존재해야한다.
    * branches안에는 'StatefulShellBranch'로 루트를 작성해줘야한다.  */
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => BottomWidget(child: child),
      branches: [
        StatefulShellBranch(
          routes: [
            StatefulShellRoute.indexedStack(
              builder: (context, state, child) => MusicTabScreen(child: child),
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/music',
                      // builder: (context, state) => AudiobookScreen(),
                      builder: (context, state) => MusicScreen(),
                      routes: [
                        GoRoute(
                          path: 'list/:pathName',
                          builder: (context, state) {
                            // 'pathName' 매개변수 값 가져오기
                            final String pathName =
                                state.pathParameters['pathName']!;
                            return MusicListScreen(pathName: pathName);
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'audiobook',
                      builder: (context, state) => const AudiobookScreen(),
                    ),
                  ],
                ),
              ],
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

    // 스플래쉬 화면
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
  ],
);
