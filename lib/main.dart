import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/controller/music/music_player_controller.dart';
import 'package:atempo_app/firebase_options.dart';
import 'package:atempo_app/screens/home/not_found_screen.dart';
import 'package:atempo_app/controller/account/app_user_controller.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:atempo_app/service/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() async {
  // Flutter 엔진 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // Kakao SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '6ea9210f514e9ffe855d080b31d79eda',
    javaScriptAppKey: '19636b69f3b752a340cf004d2528d0e8',
  );

  // Firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Splash 화면 유지
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // 컨트롤러 초기화 및 데이터 로드
  final userController = Get.put(AppUserController());
  await userController.fetchUserData(); // 사용자 데이터 먼저 로드

  final diaryController = Get.put(DiaryController()); // 이후 다이어리 컨트롤러 초기화
  await diaryController.fetchAllDiariesFromFirebase();

  FlutterNativeSplash.remove(); // 데이터 로드 완료 후 스플래시 제거

  runApp(const MainScreenApp());
}

class MainScreenApp extends StatelessWidget {
  const MainScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 숨김
      title: 'aTempo ',
      home: MainRouter(),
      unknownRoute: GetPage(
          name: '/not-found', page: () => NotFoundScreen()), // 404 페이지 처리
    );
  }
}

// MainRouter는 GoRouter 라우터를 사용
class MainRouter extends StatelessWidget {
  const MainRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ko', ''),
      ],
      routerConfig: router, // GoRouter 설정을 호출
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: mBackgroundColor,
        primarySwatch: Colors.green,
      ),
    );
  }
}
