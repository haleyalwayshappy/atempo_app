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
  bool _isLogin = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // 로그인 여부 확인 (여기서는 임의로 설정)
  void _checkLoginStatus() {
    // 예: 서버나 로컬 저장소에서 로그인 상태를 가져오는 로직 추가
    // 현재는 임의로 2초 후 로그인 여부를 설정
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLogin = true;  // 임의로 로그인 상태 설정
      });
      // 로그인 상태에 따라 경로 이동
      if (_isLogin) {
        context.go('/home');  // 로그인 상태라면 /home으로 이동
      } else {
        context.go('/login');  // 로그인하지 않았다면 /login으로 이동
      }
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
