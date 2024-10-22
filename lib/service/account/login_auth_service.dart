/*
import 'package:atempo_app/model/user_data.dart'; // AppUser 모델을 정의한 파일
import 'package:atempo_app/service/account/join_user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 이메일/비밀번호 회원가입
  Future<void> signUpWithEmailPassword(
      UserCredential userCredential, String name) async {
    await _saveUserToFirestore(
      userCredential,
      {'nickname': name, 'email': userCredential.user!.email},
      0, // 이메일 가입: 0
    );
    print('사용자 정보가 Firestore에 저장되었습니다.');
  }

  // 이메일/비밀번호 로그인
  Future<void> loginWithEmailPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      bool isVerified = userCredential.user!.emailVerified;

      if (!isVerified) {
        await _auth.signOut();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("이메일 인증을 완료해주세요."),
          ),
        );
      } else {
        context.go('/home');
      }
    } catch (e) {
      print('로그인 실패: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('로그인에 실패했습니다.'),
        ),
      );
    }
  }

  // 구글 로그인
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return; // 사용자가 구글 로그인을 취소한 경우
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Firestore에 사용자 정보 저장
      await _saveUserToFirestore(
        userCredential,
        {'nickname': googleUser.displayName, 'email': googleUser.email},
        1, // 구글 가입: 1
      );

      context.go('/home');
    } catch (e) {
      print('구글 로그인 실패: $e');
    }
  }

// 카카오 로그인
  Future<void> signInWithKakao(BuildContext context) async {
    try {
      // 카카오 로그인 처리 함수
      OAuthToken? token;
      if (await isKakaoTalkInstalled()) {
        try {
          token = await UserApi.instance.loginWithKakaoAccount();
        } catch (error) {
          print('카카오톡으로 로그인 실패: $error');
          if (error is PlatformException && error.code == 'CANCELED') {
            return; // 사용자가 로그인 취소한 경우 처리
          }
        }
      }

      // 카카오톡 설치되어 있지 않거나 로그인 실패 시 카카오 계정으로 로그인
      token ??= await UserApi.instance.loginWithKakaoAccount();
      print('카카오 계정으로 로그인 성공');

      // 사용자 정보 요청
      final kakaoUser = await UserApi.instance.me();
      String? kakaoEmail = kakaoUser.kakaoAccount?.email;
      String? kakaoName = kakaoUser.kakaoAccount?.name;

      // Firebase 인증 연동
      var credential = _createFirebaseCredential(token);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Firestore에 사용자 정보 저장
      AppUser newUser = AppUser(
        uid: userCredential.user!.uid,
        name: kakaoName ?? 'Unknown',
        email: kakaoEmail ?? 'Unknown',
        signUpMethod: 2, // 카카오 가입: 2
      );

      await _saveUserToFirestore(newUser);

      context.go('/home');
    } catch (error) {
      print('카카오 로그인 실패: $error');
    }
  }

// Firebase 인증 자격 증명 생성
  OAuthCredential _createFirebaseCredential(OAuthToken token) {
    var provider = OAuthProvider('oidc.atempo');
    return provider.credential(
      idToken: token.idToken,
      accessToken: token.accessToken,
    );
  }

// Firestore에 사용자 정보 저장
  Future<void> _saveUserToFirestore(UserCredential userCredential,
      Map<String, String?> userInfo, int signUpMethod) async {
    final newUser = AppUser(
      uid: userCredential.user!.uid,
      name: userInfo['nickname'] ?? 'Unknown',
      email: userInfo['email'] ?? 'Unknown',
      signUpMethod: signUpMethod,
    );
  }

// Firestore에서 사용자 정보 가져오기
  Future<AppUser?> getUserFromFirestore(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await _firestore.collection("users").doc(uid).get();

      // 데이터가 존재하는 경우
      if (doc.exists && doc.data() != null) {
        final data = doc.data()!; // Map<String, dynamic> 형식의 데이터
        return AppUser.fromMap(data, uid);
      } else {
        print("사용자 정보를 찾을 수 없습니다.");
        return null;
      }
    } catch (e) {
      print("Firestore에서 사용자 정보 가져오기 실패: $e");
      return null;
    }
  }
}
*/
