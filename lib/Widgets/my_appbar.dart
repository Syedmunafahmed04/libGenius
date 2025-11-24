import 'package:flutter/material.dart';
import 'package:libgenius/Global/colors.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff333333),

      surfaceTintColor: Color(0xff333333),

      leading: Icon(Icons.menu, color: whiteColor, size: 20),

      title: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Text(
            'Hello',
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Text(
            'Syed Munaf Ahmed',
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.w900,
              fontSize: 13,
            ),
          ),
        ],
      ),

      centerTitle: true,
    );
  }
}
