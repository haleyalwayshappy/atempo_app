import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:atempo_app/model/router.dart';

void main() => runApp(MainScreenApp());

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
