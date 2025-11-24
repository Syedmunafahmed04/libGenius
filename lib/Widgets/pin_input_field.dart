import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';

class MyPinInputField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final int maxLength;

  const MyPinInputField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.maxLength = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.5),
      child: SizedBox(
        width: Get.width * .11,
        height: 45,
        child: TextField(
          controller: controller,
          autofocus: true,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: maxLength,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
            FilteringTextInputFormatter.digitsOnly,
          ],
          cursorColor: mainThemeColor,
          style: TextStyle(fontSize: 25, color: whiteColor),
          decoration: InputDecoration(
            counterText: '',
            fillColor: whiteColor.withValues(alpha: 0.2),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 2),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),

              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}