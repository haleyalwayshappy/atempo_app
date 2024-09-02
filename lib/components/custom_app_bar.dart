import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = "",
    this.showBackButton = true,
    this.titleAlignment = Alignment.center,
    this.titleWidget,
    this.elevation = 4.0,
  }) : super(key: key);

  final String title;
  final bool showBackButton;
  final AlignmentGeometry titleAlignment;
  final Widget? titleWidget;
  final double elevation;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: const Color(0xFF262E34),
      leading: showBackButton
          ? GestureDetector(
              onTap: () {
                // Get.back();
                print("on back button 눌렀을때");
              },
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/images/icons_appbar_back.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          : Container(width: 50),
      title: Container(
        alignment: titleAlignment,
        height: 62,
        child: (titleWidget != null)
            ? titleWidget
            : Container(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFBC9D6C),
                  ),
                ),
              ),
      ),
      actions: [
        Container(width: 50),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(62);
}
