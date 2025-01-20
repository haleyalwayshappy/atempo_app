import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:atempo_app/controller/account/app_user_controller.dart';
import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/controller/music/music_player_controller.dart';
//TODO : 현재 안쓰는 페이지

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true; // 로딩 상태 관리
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // 애니메이션 컨트롤러 초기화
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // 애니메이션 시작
    _controller.forward();

    // 초기화 작업 시작
    initializeApp();
  }

  Future<void> initializeApp() async {
    try {
      // 초기 데이터 가져오기
      Get.put(AppUserController());
      //Get.put(DiaryController());
      Get.put(MusicPlayerController());
      FlutterNativeSplash.remove();
      // 데이터 로딩 딜레이 (예: 네트워크 호출)
      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      print('초기화 실패: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false; // 로딩 완료
        });
        context.go('/home'); // 홈 화면으로 이동
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedScale(
          scale: _controller.value * 1.5 + 1, // 점점 확대
          duration: const Duration(seconds: 2),
          child: Image.asset(
            'assets/images/landing_image.png',
            fit: BoxFit.cover, // 화면 전체 덮기
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
