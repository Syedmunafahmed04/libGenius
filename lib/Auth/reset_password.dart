import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Controllers/auth_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_body.dart';
import 'package:libgenius/Widgets/my_button.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class ResetPassword extends StatefulWidget {
  final String cms;
  const ResetPassword({super.key, required this.cms});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final cmsController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isObscure = true;
  bool confirmObscure = true;
  final formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
  }

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
                Text('Reset Password', style: authHeadingStyle),
                height(0.01),
                // MyTextField(
                //   hintText: 'Enter CMS',
                //   controller: cmsController,

                //   validation: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter cms';
                //     }
                //     return null;
                //   },
                // ),
                MyTextField(
                  hintText: 'Enter Password',
                  controller: passwordController,
                  isObscure: isObscure,
                  trailing: IconButton(
                    icon: isObscure
                        ? Icon(Icons.visibility_off_outlined, color: whiteColor)
                        : Icon(Icons.visibility_outlined, color: whiteColor),
                    onPressed: () {
                      setState(() => isObscure = !isObscure);
                    },
                  ),
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),

                MyTextField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  isObscure: confirmObscure,
                  trailing: IconButton(
                    icon: confirmObscure
                        ? Icon(Icons.visibility_off_outlined, color: whiteColor)
                        : Icon(Icons.visibility_outlined, color: whiteColor),
                    onPressed: () {
                      setState(() => confirmObscure = !confirmObscure);
                    },
                  ),
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm password';
                    }
                    if (value != passwordController.text.trim()) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                height(0.01),
                MyButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await authController.resetPassword(
                        cms: widget.cms,
                        password: confirmPasswordController.text.trim(),
                      );
                    }
                  },
                  label: 'Reset Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
