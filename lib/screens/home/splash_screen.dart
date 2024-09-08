import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
  with SingleTickerProviderStateMixin{
  @override
  void initState(){
    super.initState();
    // 2초뒤 화면 이동
    Timer(const Duration(seconds: 2),(){
      Navigator.pushNamed(context,"home");
  });

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20,),
            Text("로딩중..."),
          ],
        ),
      ),
    );
  }
}
