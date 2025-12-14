import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: scaffoldBackgroundColor),
        home: SplashScreen(),
      ),
    );
  }
}
