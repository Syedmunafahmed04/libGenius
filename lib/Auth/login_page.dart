import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Auth/forget_password.dart';
import 'package:libgenius/Auth/sign_up.dart';
import 'package:libgenius/BottomNavBar/my_bottom_bar.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_body.dart';
import 'package:libgenius/Widgets/my_button.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cmsController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;
  bool remember = true;
  final formKey = GlobalKey<FormState>();

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
                Text('Login', style: authHeadingStyle),
                height(0.01),
                MyTextField(
                  hintText: 'Enter CMS',
                  controller: cmsController,
                  keyboardType: TextInputType.number,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter email address';
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
                Row(
                  children: [
                    Checkbox(
                      checkColor: whiteColor,
                      activeColor: mainThemeColor,
                      side: BorderSide(color: whiteColor),
                      value: remember,
                      onChanged: (value) {
                        setState(() {
                          remember = value!;
                        });
                      },
                    ),
                    Text("Remember Me", style: TextStyle(color: whiteColor)),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const ForgetPassword());
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                height(0.01),
                MyButton(
                  onTap: () async {
                    Get.to(() => MyBottomBar());
                    // if (formKey.currentState!.validate()) {
                    //   await authController.login(
                    //     email: emailController.text,
                    //     password: passwordController.text,
                    //     remember: remember,
                    //   );
                    // }
                  },
                  label: 'Login',
                ),

                height(0.045),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const SignUp());
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Don’t Have an Account?",
                            style: TextStyle(color: whiteColor),
                          ),
                          const TextSpan(text: "  "),
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
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
