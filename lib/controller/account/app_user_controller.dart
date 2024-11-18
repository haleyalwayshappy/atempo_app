import 'package:atempo_app/model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUserController extends GetxController {
  var appUser = Rxn<AppUser>(); // 사용자가 널이 될수 있는 상태로 관리

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  onInit() {
    super.onInit();
    fetchUserData(); // 컨트롤러 초기화시 사용자 데이터 불러오기
  }

  // firestore에서 사용자 정보 가져오기
  Future<void> fetchUserData() async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;

      if (firebaseUser != null) {
        String uid = firebaseUser.uid;
        DocumentSnapshot<Map<String, dynamic>> doc =
            await _firestore.collection('users').doc(uid).get();

        if (doc.exists && doc.data() != null) {
          appUser.value = AppUser.fromMap(doc.data()!, uid); // 사용자 데이터 설정
          print("사용자 정보 ${appUser.value}");
        } else {
          print("사용자 정보를 가져올 수 없습니다.");
        }
      }
    } catch (e) {
      print("파이어스토어에서 사용자 정보 가져오기싫패 : $e ");
    }
  }

  AppUser getUserdata() {
    return AppUser(
        uid: appUser.value!.uid,
        name: appUser.value!.name,
        email: appUser.value!.email,
        signUpMethod: appUser.value!.signUpMethod);
  }

  /// 유저정보 클리어,  로그아웃 시에
  void clearUserData() {
    appUser.value = null;
  }

  Future<void> deleteAccount(BuildContext context) async {
    try {
      User? user = _auth.currentUser;
      print("유저 정보 확인 ${user}");
      if (user != null) {
        // Firestore에서 사용자 데이터 삭제
        await _firestore.collection('users').doc(user.uid).delete();

        // Firebase Auth에서 계정 삭제
        await user.delete();

        // 성공 메시지
        Get.snackbar(
          '탈퇴 성공',
          '회원 탈퇴가 완료되었습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        Get.snackbar(
          '오류',
          '다시 로그인 후 시도해 주세요.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          '탈퇴 실패',
          '회원 탈퇴에 실패했습니다: ${e.message}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        '오류',
        '오류가 발생했습니다: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
