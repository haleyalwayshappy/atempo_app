import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:atempo_app/service/router.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: MainScreenApp()));
}

class MainScreenApp extends StatelessWidget {
  const MainScreenApp({Key? key}) : super(key: key);

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
