import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Auth/login_page.dart';
import 'package:libgenius/BottomNavBar/my_bottom_bar.dart';
import 'package:libgenius/Controllers/auth_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Models/user_model.dart';
import 'package:libgenius/Services/push_notification_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void myInit() async {
    final user = box.read('user');
    final password = box.read('password');
    PushNotificationSystem().firebaseInit(context);
    await Future.delayed(Duration(seconds: 2));
    if (user != null && password != null) {
      userModel = UserModel.fromJson(user).obs;
      // await authController.login(
      //   cms: userModel.value.studentData?.cmsId ?? '',
      //   password: password,
      //   fromSplash: true,
      // );
      await Get.offAll(() => MyBottomBar());
    } else {
      Get.offAll(() => LoginPage());
    }
  }

  final authController = Get.put(AuthController());
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
