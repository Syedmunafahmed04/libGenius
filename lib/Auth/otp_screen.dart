import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Controllers/auth_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_body.dart';
import 'package:libgenius/Widgets/my_button.dart';
import 'package:libgenius/Widgets/pin_input_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.fromForget = false, required this.email});
  final bool fromForget;
  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());
  late final List<TextEditingController> pins;

  @override
  void initState() {
    super.initState();
    pins = List.generate(6, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (final c in pins) {
      c.dispose();
    }
    super.dispose();
  }

  void _handlePaste(String pasted) {
    final chars = pasted.trim().split('');
    for (var i = 0; i < pins.length; i++) {
      pins[i].text = i < chars.length ? chars[i] : '';
    }
    // remove focus from text fields
    FocusScope.of(context).unfocus();
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
                Text('Verify your Email', style: authHeadingStyle),
                height(0.003),
                Text(
                  "Please enter OTP that was sent to your email "
                  "${widget.email}",
                  style: TextStyle(color: whiteColor),
                ),
                height(0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (i) {
                    return MyPinInputField(
                      controller: pins[i],
                      maxLength: i == 0 ? 6 : 1,
                      onChanged: (value) {
                        if (i == 0 && value.length > 1) {
                          _handlePaste(value);
                        } else if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    );
                  }),
                ),
                height(0.03),
                MyButton(
                  onTap: () async {
                    final String otp = pins.map((e) => e.text).join();

                    if (widget.fromForget) {
                      await authController.verifyForgetOtp(otp: otp);
                    } else {
                      await authController.verifyOtp(otp: otp);
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
