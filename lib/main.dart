import 'package:atempo_app/firebase_options.dart';
import 'package:atempo_app/screens/diary/getx_test_diary.dart';
import 'package:atempo_app/screens/home/home_screen.dart';
import 'package:atempo_app/screens/home/not_found_screen.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:atempo_app/service/router.dart';
import 'package:get/get.dart';


import 'package:atempo_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:atempo_app/service/router.dart'; // 기존 GoRouter 설정이 포함된 파일
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MainScreenApp());
}

class MainScreenApp extends StatelessWidget {
  const MainScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,  // 디버그 배너 숨김
      title: 'Atempo App',
      theme: ThemeData(
        scaffoldBackgroundColor: mBackgroundColor,
        primarySwatch: Colors.blue,
      ),
      home: MainRouter(),
      unknownRoute: GetPage(name: '/not-found', page: () => NotFoundScreen()), // 404 페이지 처리
    );
  }
}

// MainRouter는 GoRouter 라우터를 사용
class MainRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // GoRouter 설정을 호출
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
    );
  }
}


//
//
// theme: ThemeData(
// // appBarTheme: AppBarTheme(
// //   actionsIconTheme: IconThemeData(
// //     color: mEnabledColor,
// //     size: 32,
// //   ),
// //   backgroundColor: mBackgroundColor,
// //   centerTitle: false,
// //   titleTextStyle: TextStyle(
// //     color: mFontDarkColor,
// //     fontSize: 24,
// //     fontWeight: FontWeight.w800,
// //     letterSpacing: 4.0,
// //   ),
// // ),
// scaffoldBackgroundColor: mBackgroundColor,
// ),
/*

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MainScreenApp());
}

class MainScreenApp extends StatelessWidget {
  MainScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        // appBarTheme: AppBarTheme(
        //   actionsIconTheme: IconThemeData(
        //     color: mEnabledColor,
        //     size: 32,
        //   ),
        //   backgroundColor: mBackgroundColor,
        //   centerTitle: false,
        //   titleTextStyle: TextStyle(
        //     color: mFontDarkColor,
        //     fontSize: 24,
        //     fontWeight: FontWeight.w800,
        //     letterSpacing: 4.0,
        //   ),
        // ),
        scaffoldBackgroundColor: mBackgroundColor,
      ),
    );
  }
}
*/
