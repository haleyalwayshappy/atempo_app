import 'dart:async';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/home';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // 2초뒤 화면 이동
    Timer(const Duration(seconds: 3), () {
      context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // color: Colors.yellow,
                height: 230,
              ),
              Image.asset(
                height: 80,
                // color: mPrimaryColor,
                'assets/images/logo_atempo.png',
                width: 300,
              ),
              Container(
                // color: Colors.yellow,
                height: 300,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

/*            Container(
              // 컨테이너 안에 데코레이션 박스에 이미지 넣음
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/logo_atempo.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
*/
