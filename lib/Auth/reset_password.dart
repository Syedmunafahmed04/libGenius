import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Controllers/auth_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_body.dart';
import 'package:libgenius/Widgets/my_button.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final cmsController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;
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
                MyTextField(
                  hintText: 'Enter CMS',
                  controller: cmsController,
                  keyboardType: TextInputType.number,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter cms';
                    }
                    return null;
                  },
                ),
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
                height(0.01),
                height(0.01),
                MyButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await authController.resetPassword(
                        cms: cmsController.text.trim(),
                        password: passwordController.text.trim(),
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
