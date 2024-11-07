import 'package:atempo_app/model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          print("사용자 정보 ${appUser.value?.uid}");
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

  // 유저정보 클리어
  void clearUserData() {
    appUser.value = null;
  }
}
