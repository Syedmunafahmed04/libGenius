import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Controllers/auth_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_body.dart';
import 'package:libgenius/Widgets/my_button.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final cmsController = TextEditingController();
  final authController = Get.put(AuthController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyBody(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(0.3),
                Text('Forget Password', style: authHeadingStyle),
                height(0.003),
                Text(
                  "Enter your CMS ID, an OTP will be sent to your registered email address.",
                  style: TextStyle(color: textLightColor),
                ),
                height(0.02),
                MyTextField(
                  hintText: "Enter CMS ID",
                  controller: cmsController,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email address";
                    }
                    return null;
                  },
                ),
                height(0.01),
                MyButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await authController.forgetPassword(
                        cms: cmsController.text.trim(),
                      );
                    }
                  },
                  label: "Continue",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
