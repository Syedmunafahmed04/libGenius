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
  final emailController = TextEditingController();
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
                  "Enter the email address associated with your account and we'll send you OTP to reset your password.",
                  style: TextStyle(color: textLightColor),
                ),
                height(0.02),
                MyTextField(
                  hintText: "Enter Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                        email: emailController.text.trim(),
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
