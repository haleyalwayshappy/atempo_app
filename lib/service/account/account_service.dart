import 'package:atempo_app/controller/account/nickname_generator.dart';
import 'package:atempo_app/model/sign_up_path_data.dart';
import 'package:atempo_app/model/user_data.dart';
import 'package:atempo_app/controller/account/app_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class AccountService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AppUserController userController = Get.find<AppUserController>();
  NicknameGenerator generator = NicknameGenerator();

  /// 이메일/비밀번호 회원가입
  Future<void> signUpWithEmailPassword(
      String email, String password, String name, String nickName) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await userCredential.user!.sendEmailVerification();

    await _saveUserToFireStore(
      userCredential,
      {'name': name, 'email': email, 'nickName': nickName},
      SignUpPath.email, // 구글 가입: 1
    );
  }

  /// 이메일/비밀번호 로그인
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
        // 사용자 정보 가져오기 + 앱유저에 값 담기
        await userController.fetchUserData();
        context.go('/home');
      }
    } catch (e) {
      // TODO :  throw Exception(e); 로 변경해서 처리해야함
      // TODO : 서비스 로직에서 화면 로직을 변경 해야함

      throw Exception(e);
    }
  }

  /// 구글 로그인
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

      String? name = googleUser.displayName;

      if (name == null) {
        print('이름 정보가 없습니다.');
        throw FirebaseAuthException(
          code: 'name-null',
          message: '이름 정보가 null입니다. 회원가입에 실패했습니다.',
        );
      }

      /// Firestore에 사용자 정보 저장
      await _saveUserToFireStore(
        userCredential,
        {'name': name, 'email': googleUser.email},
        SignUpPath.google,
      );

      /// 사용자 정보 가져오기 + 앱유저에 값 담기
      await userController.fetchUserData();

      context.go('/home');
    } catch (e) {
      print('구글 로그인 실패: $e');
    }
  }

  /// 사용자 정보 업데이트
  Future<void> updateUserInformation({
    required String uid,
    required String name,
    required String nickname,
    required String email,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'name': name,
        'nickName': nickname,
        'email': email,
      });
    } catch (error) {
      print("Firestore 업데이트 실패: $error");
      throw Exception("Firestore 업데이트에 실패했습니다.");
    }
  }

  /// 카카오 로그인
  Future<void> signInWithKakao(BuildContext context) async {
    try {
      // 카카오톡 설치 여부 확인 후 로그인
      OAuthToken? token;
      if (await isKakaoTalkInstalled()) {
        try {
          token = await UserApi.instance.loginWithKakaoTalk();
        } catch (error) {
          print('카카오톡으로 로그인 실패: $error');
          if (error is PlatformException && error.code == 'CANCELED') {
            return; // 사용자가 로그인 취소한 경우 처리
          }
        }
      }

      // 카카오톡이 없거나 실패한 경우 카카오 계정으로 로그인
      token ??= await UserApi.instance.loginWithKakaoAccount();
      print('카카오 계정으로 로그인 성공');

      // String kakaoName = token.
      // Firebase 인증 연동
      var credential = _createFirebaseCredential(token);
      // String? kakaoName = kakaoUser.kakaoAccount?.profile?.nickname;

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Firestore에서 사용자 정보 확인
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .get();

      if (!userDoc.exists) {
        // 새 사용자라면 이름 입력 화면으로 이동
        // 사용자 정보 요청
        var user = await UserApi.instance.me();
        // 이메일
        // String? email = user.kakaoAccount?.email;
        // Firestore에 사용자 정보 저장
        await _saveUserToFireStore(
            userCredential, {'nickName': '', 'email': ''}, SignUpPath.kakao);

        // Firestore 저장 후 추가 정보 화면으로 이동하며 uid 전달
        final String uid = userCredential.user!.uid;
        context.go('/add_information', extra: {'uid': uid});
      } else {
        // 기존 사용자라면 홈 화면으로 이동
        await userController.fetchUserData(); // 사용자 정보 가져오기
        context.go('/home');
      }

      // 사용자 정보 가져오기 + 앱유저에 값 담기
      await userController.fetchUserData();
    } catch (error) {
      print('카카오 로그인 실패: $error');
    }
  }

  /// 애플 로그인
  Future<void> signInWithApple(BuildContext context) async {
    try {
      final appleProvider = AppleAuthProvider();

      // Firebase 인증 처리
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithProvider(appleProvider);

      // 이름과 이메일 가져오기
      final String? name = generator.generateNickname();
      final String? email = userCredential.user?.email;

      // 이름이 없는 경우 기본 이름 설정
      String finalName = name ?? '사용자';

      // Firestore에 사용자 정보 저장
      await _saveUserToFireStore(
        userCredential,
        {'name': finalName, 'email': email ?? 'unknown'},
        SignUpPath.apple,
      );

      // 사용자 정보 가져오기 + 앱유저에 값 담기
      await userController.fetchUserData();

      // 홈 화면으로 이동
      context.go('/home');
    } catch (e) {
      print('애플 로그인 실패: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('애플 로그인 실패: $e')),
      );
    }
  }

  /// 로그아웃
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    context.go('/home');
  }

  /// 파이어 베이스 인증 자격 증명 생성
  OAuthCredential _createFirebaseCredential(OAuthToken token) {
    var provider = OAuthProvider('oidc.atempo');
    return provider.credential(
      idToken: token.idToken,
      accessToken: token.accessToken,
    );
  }

  /// 파이어 스토어에 사용자 정보 저장
  Future<void> _saveUserToFireStore(UserCredential userCredential,
      Map<String, String> userInfo, SignUpPath signUpMethod) async {
    final newUser = AppUser(
      uid: userCredential.user!.uid,
      name: userInfo['name'] ?? 'unKnown',
      nickName: userInfo['nickName'] ?? 'unknown',
      email: userInfo['email'] ?? 'unknown',
      signUpMethod: signUpMethod.name, // 문자열로 변환
    );

    await _firestore.collection("users").doc(newUser.uid).set(newUser.toMap());
  }

  // // 파이어 스토어에서 사용자 정보 가져오기
  // Future<AppUser?> getUserFromFirestore(String uid) async {
  //   try {
  //     DocumentSnapshot<Map<String, dynamic>> doc =
  //         await _firestore.collection("users").doc(uid).get();
  //
  //     // 데이터가 존재하는 경우
  //     if (doc.exists && doc.data() != null) {
  //       final data = doc.data()!; // Map<String, dynamic> 형식의 데이터
  //       return AppUser.fromMap(data, uid);
  //     } else {
  //       print("사용자 정보를 찾을 수 없습니다.");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Firestore에서 사용자 정보 가져오기 실패: $e");
  //     return null;
  //   }
  // }

  // 이름 유효성 검사 함수
  String? validateNickName(String? value) {
    if (value == null || value.isEmpty) {
      return '닉네임을 입력해주세요.';
    }
    final nameRegex = RegExp(r'^[a-zA-Z가-힣0-9\s]+$'); // 숫자 허용
    if (!nameRegex.hasMatch(value)) {
      return '닉네임은 특수 문자를 포함할 수 없습니다.';
    }
    return null;
  }

  // 이름 유효성 검사 함수
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return '이름을 입력해주세요.';
    }
    final nameRegex = RegExp(r'^[a-zA-Z가-힣\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return '이름은 특수 문자나 숫자를 포함할 수 없습니다.';
    }
    return null;
  }

  // 이메일 유효성 검사 함수
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을 입력해주세요.';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return '이메일 주소에는 @와 .이 포함되어야 합니다.';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return '유효한 이메일 주소를 입력해주세요.';
    }
    return null;
  }

  // 비밀번호 유효성 검사 함수
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    final passwordRegex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return '비밀번호는 영어, 숫자, 특수 문자를 포함하고 8자리 이상이어야 합니다.';
    }
    return null;
  }
}
