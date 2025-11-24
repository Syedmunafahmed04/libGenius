import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Auth/login_page.dart';
import 'package:libgenius/Global/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void myInit() async {
    await Future.delayed(Duration(seconds: 2));

    Get.to(() => LoginPage());
  }

  @override
  void initState() {
    super.initState();

    myInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,

        width: Get.width,

        decoration: BoxDecoration(
          color: whiteColor,
          image: DecorationImage(
            fit: BoxFit.fill,

            image: AssetImage('assets/splash.png'),
          ),
        ),

        // child: Center(child: Image.asset('assets/splash.png', scale: 3.5)),
      ),
    );
  }
}
