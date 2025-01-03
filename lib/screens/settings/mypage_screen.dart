import 'package:atempo_app/controller/account/nickname_generator.dart';
import 'package:atempo_app/model/sign_up_path_data.dart';
import 'package:atempo_app/model/user_data.dart';
import 'package:atempo_app/screens/diary/diary_main_screen.dart';
import 'package:atempo_app/screens/widgets/custom_app_bar.dart';
import 'package:atempo_app/controller/account/app_user_controller.dart';
import 'package:atempo_app/service/account/account_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:package_info_plus/package_info_plus.dart'; // Assuming you have constants for colors, etc.

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  String appName = "Loading...";
  String packageName = "Loading...";
  String version = "Loading...";
  String buildNumber = "Loading...";
  bool isEditing = false; // 닉네임 수정 모드 상태

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
  }

  Future<void> _loadAppInfo() async {
    WidgetsFlutterBinding.ensureInitialized();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    // AppUserController를 가져옴
    final AppUserController userController = Get.find<AppUserController>();
    final TextEditingController _nicknameController = TextEditingController();
    AccountService accountService = AccountService();

    return Scaffold(
      appBar: CustomAppBar(
        titleText: "마이페이지",
        isMyPage: true,
        showBackButton: true,
      ),
      backgroundColor: mBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "행복하세요",
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: mFontDarkColor,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(width: 3),
                  // 닉네임
                  Obx(() {
                    final appUser = userController.appUser.value;
                    if (appUser == null) {
                      return const Flexible(
                        child: Text(
                          "등록된 이름이 없습니다.",
                          overflow: TextOverflow.ellipsis, // 텍스트가 길면 "..." 표시
                          softWrap: false, // 한 줄에 표시
                        ),
                      );
                    } else {
                      return Flexible(
                        child: Text(
                          appUser.nickName,
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            backgroundColor: mJoyColor,
                            color: mFontDarkColor,
                            letterSpacing: 1.2,
                          ),
                          overflow: TextOverflow.ellipsis, // 텍스트가 길면 "..." 표시
                          softWrap: false, // 한 줄에 표시
                        ),
                      );
                    }
                  }),
                  SizedBox(width: 3),
                  Text(
                    "님🥳",
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: mFontDarkColor,
                      letterSpacing: 1.2,
                    ),
                  ),
                  //    수정
                  IconButton(
                    onPressed: () {
                      // 준비중입니다 팝업
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text('준비중입니다.'),
                      //   ),
                      // );

                      final appUser = userController.appUser.value;
                      if (appUser != null) {
                        _nicknameController.text =
                            appUser.nickName; // 현재 닉네임 설정
                        _showNicknameEditDialog(context, _nicknameController,
                            userController, accountService);
                      }
                    },
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // 구분선
              Container(
                height: 1,
                color: mGrey2Color,
              ),
              SizedBox(height: 40),
              // MY
              Text(
                'MY',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: mFontDarkColor,
                  letterSpacing: -0.5,
                ),
              ),

              SizedBox(height: 20),
              //
              // GestureDetector(
              //   onTap: () async {
              //     print("프로필 수정 버튼 클릭");
              //   },
              //   child: Text(
              //     '프로필 수정',
              //     style: TextStyle(
              //       fontFamily: 'Pretendard',
              //       fontWeight: FontWeight.w400,
              //       fontSize: 18,
              //       color: mFontDarkColor,
              //       letterSpacing: -0.5,
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 10,
              ),
              // 일기 보관
              GestureDetector(
                onTap: () {
                  context.go('/hide_diary');

                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text('준비중입니다.'),
                  //   ),
                  // );
                },
                child: Text(
                  '보관된 일기',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 14),
/*              GestureDetector(
                onTap: () {},
                child: Text(
                  '일기 통계',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 14),*/
/*
              GestureDetector(
                onTap: () {},
                child: Text(
                  '뮤직 히스토리',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
*/
              SizedBox(height: 14),
              // 구분선
              Container(
                height: 1,
                color: mGrey2Color,
              ),
              SizedBox(height: 20),
              // 계정
              // Text(
              //   '계정',
              //   style: TextStyle(
              //     fontFamily: 'Pretendard',
              //     fontWeight: FontWeight.w600,
              //     fontSize: 24,
              //     color: mFontDarkColor,
              //     letterSpacing: -0.5,
              //   ),
              // ),
              // SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Text(
                  '앱소개',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),

              SizedBox(height: 16),
              // 로그아웃
              GestureDetector(
                onTap: () async {
                  showLogoutDialog(context);
                  print("로그아웃버튼");
                },
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: mFontDarkColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 14),
              // 회원탈퇴
              GestureDetector(
                onTap: () {
                  showDeleteAccountDialog(context);
                  // TODO :  회원 탈퇴 시 해당 계정 삭제 + 파이어 스토어에 있는 필드 삭제 (uid 기준)
                },
                child: Text(
                  '회원탈퇴',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: mGrey3Color,
                    letterSpacing: -0.5,
                    decoration: TextDecoration.underline, // 밑줄 추가
                    decorationColor: mGrey3Color, // 밑줄 색상 설정
                    decorationThickness: 2.0, // 밑줄 두께 설정
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                '앱정보',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: mGrey3Color,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                "${appName} - ${version}",
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: mGrey3Color,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 로그아웃 다이얼로그
void showLogoutDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext con) {
      return AlertDialog(
        title: const Text("로그아웃"),
        content: const Text("로그아웃 하시겠습니까?"),
        actions: [
          TextButton(
            onPressed: () async {
              try {
                // Firebase 로그아웃
                await FirebaseAuth.instance.signOut();
                print(
                    "로그아웃 수행 후 user 상태 : ${FirebaseAuth.instance.currentUser}");
                // 사용자 정보 찾기
                final AppUserController userController =
                    Get.find<AppUserController>();

                //초기화
                userController.clearUserInfo();

                // 다이얼로그 닫기 및 로그인 화면으로 이동
                Navigator.of(con).pop();
                print("로그아웃 성공, 로그인 화면 이동");
                context.go('/login');
              } catch (error) {
                Navigator.of(con).pop();
                Get.snackbar(
                  '로그아웃 실패',
                  '로그아웃에 실패했습니다.',
                  snackPosition: SnackPosition.BOTTOM,
                );
                print('로그아웃 실패: $error');
              }
            },
            child: const Text("확인"),
          ),
          TextButton(
            onPressed: () => Navigator.of(con).pop(),
            child: const Text("취소"),
          ),
        ],
      );
    },
  );
}

// 회원탈퇴
void showDeleteAccountDialog(BuildContext context) {
  final AppUserController userController = Get.find<AppUserController>();
  showDialog(
    context: context,
    builder: (BuildContext con) {
      return AlertDialog(
        title: const Text("회원탈퇴"),
        content: const Text("정말 탈퇴를 진행 하시겠습니까?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // 다이얼로그 닫기
            child: const Text("취소"),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back(); // 다이얼로그 닫기
              await userController.deleteAccount(context); // 회원 탈퇴 실행
              userController.clearUserInfo();
              // 로그인 화면으로 이동
              context.go('/login');
              //초기화
            },
            child: const Text("확인"),
          ),
        ],
      );
    },
  );
}

void _showNicknameEditDialog(
    BuildContext context,
    TextEditingController controller,
    AppUserController userController,
    AccountService accountService) {
  NicknameGenerator generator = NicknameGenerator();
  String newNickname = controller.text.trim();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("닉네임 수정"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: newNickname,
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () {
                newNickname = generator.generateNickname();
                controller.text = newNickname;
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          onChanged: (value) {
            newNickname = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("취소"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (newNickname.isNotEmpty) {
                try {
                  final appUser = userController.appUser.value;
                  if (appUser != null) {
                    // Firestore 업데이트
                    await accountService.updateUserInformation(
                      uid: appUser.uid,
                      name: appUser.name,
                      nickname: newNickname,
                      email: appUser.email,
                    );

                    // 상태 업데이트
                    userController.appUser.value = AppUser(
                      uid: appUser.uid,
                      name: appUser.name,
                      nickName: newNickname, // 닉네임 업데이트
                      email: appUser.email,
                      signUpMethod: appUser.signUpMethod,
                    );

                    Get.snackbar(
                      "성공",
                      "닉네임이 성공적으로 변경되었습니다.",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                } catch (error) {
                  Get.snackbar(
                    "오류",
                    "닉네임 변경 중 오류가 발생했습니다.",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  print("닉네임 업데이트 오류: $error");
                }
                Navigator.of(context).pop();
              } else {
                Get.snackbar(
                  "오류",
                  "닉네임을 입력하세요.",
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            child: const Text("저장"),
          ),
        ],
      );
    },
  );
}
