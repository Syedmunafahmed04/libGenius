import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/global.dart';

class MyBody extends StatelessWidget {
  final Widget? child;
  const MyBody({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: myPadding,
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/auth_background.png'),
        ),
      ),
      child: child,
    );
  }
}
