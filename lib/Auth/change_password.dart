import 'package:flutter/material.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_button.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final currentPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool showCurrentPass = true;
  bool showPass = true;
  bool showConfirmPass = true;
  final formKey = GlobalKey<FormState>();
  // final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              height(0.02),
              MyTextField(
                textStyleColor: blackColor,
                hintStyleColor: blackColor,
                fillColor: Color(0xffE8E8E8),
                hintText: 'Enter Current Password',
                controller: currentPasswordController,
                isObscure: showCurrentPass,
                trailing: IconButton(
                  icon: showCurrentPass
                      ? Icon(Icons.visibility_off_outlined, color: blackColor)
                      : Icon(Icons.visibility_outlined, color: blackColor),
                  onPressed: () {
                    setState(() => showCurrentPass = !showCurrentPass);
                  },
                ),
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter current password';
                  }
                  return null;
                },
              ),
              MyTextField(
                textStyleColor: blackColor,
                hintStyleColor: blackColor,
                fillColor: Color(0xffE8E8E8),
                hintText: 'Enter New Password',
                controller: passwordController,
                isObscure: showPass,
                trailing: IconButton(
                  icon: showPass
                      ? Icon(Icons.visibility_off_outlined, color: blackColor)
                      : Icon(Icons.visibility_outlined, color: blackColor),
                  onPressed: () {
                    setState(() => showPass = !showPass);
                  },
                ),
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter new password';
                  }
                  return null;
                },
              ),
              MyTextField(
                textStyleColor: blackColor,
                hintStyleColor: blackColor,
                fillColor: Color(0xffE8E8E8),
                hintText: 'Enter Confirm Password',
                controller: confirmPasswordController,
                isObscure: showConfirmPass,
                trailing: IconButton(
                  icon: showConfirmPass
                      ? Icon(Icons.visibility_off_outlined, color: blackColor)
                      : Icon(Icons.visibility_outlined, color: blackColor),
                  onPressed: () {
                    setState(() => showConfirmPass = !showConfirmPass);
                  },
                ),
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter confirm password';
                  }
                  return null;
                },
              ),
              height(0.02),
              MyButton(
                buttonColor: mainThemeColor,
                label: "Update",
                onTap: () async {
                  // if (formKey.currentState!.validate()) {
                  //   await authController.resetPassword(
                  //     currentPassword: currentPasswordController.text,
                  //     password: passwordController.text,
                  //     confirmPassword: confirmPasswordController.text,
                  //     role: "update_password",
                  //   );
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}