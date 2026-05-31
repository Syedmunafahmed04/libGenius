import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Auth/login_page.dart';
import 'package:libgenius/BottomNavBar/my_bottom_bar.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Models/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void myInit() async {
    final user = box.read('user');
    await Future.delayed(Duration(seconds: 2));
    if (user != null) {
      userModel = UserModel.fromJson(user).obs;

      Get.offAll(() => MyBottomBar());
    } else {
      Get.offAll(() => LoginPage());
    }
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
