import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.label,
    required this.onTap,
    this.width,
    this.height,
    this.buttonColor,
    this.borderColor,
    this.borderRadius,
    this.labelColor,
    this.elevation,
    this.thickness,
    this.fontSize,
  });

  final double? fontSize;
  final String label;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? labelColor;
  final double? elevation;
  final double? thickness;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Get.height * 0.055,
      width: width ?? double.infinity,
      child: Material(
        elevation: elevation ?? 0,
        borderRadius: BorderRadius.circular(borderRadius ?? 40.0),
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 40.0),
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: thickness ?? 0,
            ),
            color: buttonColor ?? mainThemeColor,
        
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(40.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  label,
                  style: TextStyle(
                    color: labelColor ?? whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize ?? 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
