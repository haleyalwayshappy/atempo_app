import 'package:atempo_app/model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class JoinUserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
