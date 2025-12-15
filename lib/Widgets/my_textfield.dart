import 'package:flutter/material.dart';
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
    this.margin,
  });

  final String hintText;
  final Color? fillColor;
  bool isObscure = false;
  bool readOnly = false;
  bool autoFocus = false;
  final int? maxLength;
  final VoidCallback? onTap;
  final int? maxLines;

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
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.symmetric(vertical: 7.0),
      child: TextFormField(
        style: TextStyle(color: textStyleColor ?? whiteColor, fontSize: 14),
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,

        autofocus: autoFocus,
        validator: validation,
        maxLines: maxLines ?? 1,
        initialValue: defaultValue,
        cursorHeight: 18,
        controller: controller,
        readOnly: readOnly,
        obscureText: isObscure,
        keyboardType: keyboardType,
        onChanged: onChanged,
        maxLength: maxLength,
        cursorColor: whiteColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? whiteColor.withValues(alpha: 0.2),
          contentPadding: const EdgeInsets.all(12.0),
          suffixIcon: trailing,
          prefixIcon: leading,
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordersColor ?? whiteColor.withValues(alpha: 0.3),
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordersColor ?? whiteColor.withValues(alpha: 0.3),
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordersColor ?? whiteColor.withValues(alpha: 0.3),
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
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
    );
  }
}
