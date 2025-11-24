import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_body.dart';
import 'package:libgenius/Widgets/my_button.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // final authController = Get.put(AuthController());
  final cmsController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool checkValue = false;

  bool showPass = true;
  bool showConfirmPass = true;

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
                Text('Sign Up', style: authHeadingStyle),
                height(0.01),
                MyTextField(
                  hintText: 'Enter CMS',
                  controller: cmsController,
                  keyboardType: TextInputType.name,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your CMS';
                    }
                    return null;
                  },
                ),
                MyTextField(
                  hintText: 'Enter Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                MyTextField(
                  hintText: 'Enter Password',
                  controller: passwordController,
                  isObscure: showPass,
                  trailing: IconButton(
                    icon: showPass
                        ? Icon(Icons.visibility_off_outlined, color: whiteColor)
                        : Icon(Icons.visibility_outlined, color: whiteColor),
                    onPressed: () {
                      setState(() => showPass = !showPass);
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
                  isObscure: showConfirmPass,
                  trailing: IconButton(
                    icon: showConfirmPass
                        ? Icon(Icons.visibility_off_outlined, color: whiteColor)
                        : Icon(Icons.visibility_outlined, color: whiteColor),
                    onPressed: () {
                      setState(() => showConfirmPass = !showConfirmPass);
                    },
                  ),
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                ),
                height(0.02),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  checkColor: whiteColor,
                  activeColor: mainThemeColor,
                  side: BorderSide(color: whiteColor),
                  value: checkValue,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      checkValue = value!;
                    });
                  },
                  title: Text(
                    "By signing  up, you are agree to our Privacy Policy and Terms of use",
                    style: TextStyle(color: whiteColor, fontSize: 13),
                  ),
                ),
                height(0.02),
                MyButton(
                  onTap: () async {
                    // if (checkValue == false) {
                    //   myWarningDialog(
                    //     subtitle:
                    //         "Please agree to our Privacy Policy and Terms of use",
                    //     title: "Warning",
                    //   );
                    //   return;
                    // }
                    // if (formKey.currentState!.validate()) {
                    //   authController.registration(
                    //     role: "email",
                    //     name: nameController.text,
                    //     email: emailController.text,
                    //     password: passwordController.text,
                    //     confirmPassword: confirmPasswordController.text,
                    //   );
                    // }
                  },
                  label: 'Sign Up',
                ),
                height(0.03),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Already Have an Account?",
                            style: TextStyle(color: whiteColor),
                          ),
                          const TextSpan(text: "  "),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
