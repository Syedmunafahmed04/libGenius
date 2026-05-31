import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Controllers/auth_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final String? title;
  final bool isBack;
  final Widget? trailing;

  MyAppbar({
    super.key,
    this.isHome = false,
    this.title,
    this.isBack = true,
    this.trailing,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  final authConttroller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: greyColor.withValues(alpha: 0.15),

      surfaceTintColor: Colors.transparent,

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
          ? Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    userModel.value.studentData?.studentName ?? '',
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          : Text(
              title!,
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),

      centerTitle: true,

      actions: [trailing ?? SizedBox.shrink()],
    );
  }
}
