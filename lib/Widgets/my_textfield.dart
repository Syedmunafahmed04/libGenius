import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLength,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.isObscure = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.keyboardType,
    this.onChanged,
    this.trailing,
    this.bordersColor,
    this.leading,
    this.defaultValue,
    this.validation,
    this.textInputAction,
    this.onFieldSubmitted,
    this.textFieldColor,
    this.hintStyleColor,
    this.textStyleColor,
    this.width,
    this.borderRadius,
    this.fillColor,
    this.hintStyle,
    this.height,
  });

  final String hintText;
  final Color? fillColor;
  bool isObscure = false;
  bool readOnly = false;
  bool autoFocus = false;
  final int? maxLength;
  final VoidCallback? onTap;
  final int? maxLines;
  final int? minLines;
  final Widget? trailing;
  final Widget? leading;
  final Color? bordersColor;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String? defaultValue;
  final String? Function(String?)? validation;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Color? textFieldColor;
  final Color? hintStyleColor;
  final Color? textStyleColor;
  final double? width;
  final double? borderRadius;
  final FontStyle? hintStyle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: SizedBox(
        height: height,
        width: width ?? Get.width,
        child: TextFormField(
          style: TextStyle(color: textStyleColor ?? whiteColor, fontSize: 13),
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          minLines: minLines ?? 1,
          autofocus: autoFocus,
          validator: validation,
          maxLines: maxLines ?? 1,
          initialValue: defaultValue,
          controller: controller,
          readOnly: readOnly,
          obscureText: isObscure,
          keyboardType: keyboardType,
          onChanged: onChanged,
          maxLength: maxLength,
          cursorColor: blackColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? whiteColor.withValues(alpha: 0.2),
            contentPadding: const EdgeInsets.all(17.0),
            suffixIcon: trailing,
            prefixIcon: leading,
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bordersColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bordersColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: bordersColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(12),
            ),
            hintStyle: TextStyle(
              fontSize: 14,
              color: hintStyleColor ?? whiteColor.withValues(alpha: 0.8),
              fontStyle: hintStyle,
              fontWeight: FontWeight.w400,
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
