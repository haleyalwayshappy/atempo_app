import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final bool showBackButton;
  final String backLocation;

  CustomAppBar(
      {required this.titleText,
      this.showBackButton = false,
      this.backLocation = '/home'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mBackgroundColor,
      centerTitle: false,
      title: Text(
        titleText,
        style: TextStyle(
          color: mFontDarkColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                // 이전 경로를 알고 있는 경우
                if (backLocation != null) {
                  context.go(backLocation); // go_router를 사용하여 이전 페이지로 돌아가기
                } else {
                  context.pop(); // 기본적으로 이전 페이지로 돌아가기
                }
              },
            )
          : null, // 뒤로가기 버튼 숨기기
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            //  TODO 마이페이지
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
