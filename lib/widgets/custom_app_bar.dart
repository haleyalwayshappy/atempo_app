import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  // final bool showBackButton;
  final String backLocation;

  CustomAppBar(
      {required this.titleText,
      // this.showBackButton = false,
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
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            context.go('/login');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
