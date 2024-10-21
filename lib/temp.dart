// import 'package:atempo_app/screens/widgets/custom_button.dart';
// import 'package:atempo_app/screens/widgets/proceed_without_actionbutton.dart';
// import 'package:atempo_app/screens/widgets/textfield_with_title.dart';
// import 'package:atempo_app/screens/widgets/toast.dart';
// import 'package:atempo_app/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CreateAccountScreen extends StatelessWidget {
//   const CreateAccountScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true, // 키보드가 올라올 때 화면을 재배치합니다.
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16), // 좌우 패딩 추가
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 32), // 추가된 높이
//                 Text(
//                   "어템포의 가족이 되어주세요",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontFamily: 'Santteut',
//                     color: mPrimaryColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Stack(
//                   //clipBehavior: Clip.none, // 겹친 부분이 잘리지 않도록 설정
//                   children: [
//                     // Container(
//                     //   width: double.infinity,
//                     //   height: 150,
//                     //   decoration: BoxDecoration(
//                     //     image: DecorationImage(
//                     //       image: AssetImage('assets/images/emotions.png'),
//                     //       fit: BoxFit.fitWidth,
//                     //     ),
//                     //   ),
//                     // ),
//                     Positioned(
//                       top: 96,
//                       left: 0,
//                       right: 0,
//                       child: Container(
//                         height: 400,
//                         width: double.infinity,
//                         padding: EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.yellow,
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(width: 2, color: mPrimaryColor),
//                         ),
//                         child: Column(
//                           children: [
//                             TextField(
//                               decoration: InputDecoration(
//                                 labelText: "이름",
//                                 hintText: "이름을 입력하세요",
//                                 // helperText: "이메일 형식에 맞게 입력하세요",
//                                 // errorText: null,
//                                 prefixIcon: Icon(Icons.person),
//                                 // suffixIcon: Icon(Icons.check),
//                                 border: UnderlineInputBorder(),
//                                 // contentPadding: EdgeInsets.all(12.0),
//                               ),
//                             ),
//                             SizedBox(height: 24),
//                             TextField(
//                               decoration: InputDecoration(
//                                 labelText: "이메일",
//                                 hintText: "이메일을 입력하세요",
//                                 // helperText: "이메일 형식에 맞게 입력하세요",
//                                 // errorText: null,
//                                 prefixIcon: Icon(Icons.email),
//                                 // suffixIcon: Icon(Icons.check),
//                                 border: UnderlineInputBorder(),
//                                 // contentPadding: EdgeInsets.all(12.0),
//                               ),
//                             ),
//                             SizedBox(height: 24),
//                             TextField(
//                               decoration: InputDecoration(
//                                 labelText: "패스워드",
//                                 hintText: "패스워드를 입력하세요",
//                                 // helperText: "이메일 형식에 맞게 입력하세요",
//                                 // errorText: null,
//                                 prefixIcon: Icon(Icons.key),
//                                 // suffixIcon: Icon(Icons.check),
//                                 border: UnderlineInputBorder(),
//                                 // contentPadding: EdgeInsets.all(12.0),
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             TextField(
//                               decoration: InputDecoration(
//                                 labelText: "패스워드",
//                                 hintText: "패스워드를 한번 더 입력하세요",
//                                 // helperText: "이메일 형식에 맞게 입력하세요",
//                                 // errorText: null,
//                                 prefixIcon: Icon(Icons.key),
//                                 // suffixIcon: Icon(Icons.check),
//                                 border: UnderlineInputBorder(),
//                                 // contentPadding: EdgeInsets.all(12.0),
//                               ),
//                             ),
//                             SizedBox(height: 25),
//                             CustomButton(
//                               buttonText: "회원가입 하기",
//                               onPressed: () {
//                                 customToastMsg("회원가입 버튼 입력했땅");
//                               },
//                             ),
//                             SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
