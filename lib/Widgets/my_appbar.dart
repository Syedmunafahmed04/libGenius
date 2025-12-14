import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final String? title;
  final bool isBack;
  final Widget? trailing;

  const MyAppbar({
    super.key,
    this.isHome = false,
    this.title,
    this.isBack = true,
    this.trailing,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: greyColor.withValues(alpha: 0.15),

      surfaceTintColor: greyColor.withValues(alpha: 0.15),

      leading: isHome
          ? SizedBox.shrink()
          : isBack
          ? GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: whiteColor,
                size: 20,
              ),
            )
          : SizedBox.shrink(),

      title: isHome
          ? Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Syed Munaf Ahmed',
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          : Text(
              title!,
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),

      centerTitle: true,

      actions: [trailing ?? SizedBox.shrink()],
    );
  }
}
