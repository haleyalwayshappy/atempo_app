import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final bool showBackButton;
  final bool isMyPage;
  final String backLocation;

  const CustomAppBar(
      {super.key,
      required this.titleText,
      this.showBackButton = false,
      this.isMyPage = false,
      this.backLocation = '/home'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mBackgroundColor,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        titleText,
        style: TextStyle(
          color: mFontDarkColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
      actions: [
        if (!isMyPage)
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              context.go('/my_page');
              // index = 0;
            },
          ),
      ],
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: mFontDarkColor),
              onPressed: () {
                context.go(backLocation);
              },
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
