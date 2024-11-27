import 'package:atempo_app/model/sign_up_path_data.dart';

class AppUser {
  final String uid;
  final String name;
  final String email;
  final String signUpMethod;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.signUpMethod,
  });

  // Firestore에 저장할 데이터를 Map으로 변환
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'signUpMethod': signUpMethod,
    };
  }

  // Firestore에서 가져온 데이터를 AppUser 객체로 변환
  factory AppUser.fromMap(Map<String, dynamic> map, String uid) {
    return AppUser(
      uid: uid,
      name: map['name'] ?? 'Unknown',
      email: map['email'] ?? 'Unknown',
      signUpMethod: map['signUpMethod'] ?? 0,
    );
  }
}

/*

당장 고민해야할것은 아니지만 후에 결제 시스템이 생긴다면
결제 내역에 관한 데이터 클래스가 필요할지
payment 를 따로 만들고 , field중 하나 uid 값을 연결

다이어리 저장 내역을 유저에 저장해야하는지 ?

*/
