import 'package:flutter/material.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.ontap,
    required this.title,
    required this.subtitle,
    this.btnTitle,
    this.image,
    this.secondButtonLabel,
    this.secondButtonOnTap,
    this.isTwoButton = false,
    this.secondButtonWidth,
    this.firstButtonWidth,
    this.showIcon = false,
    this.showSecondIcon = false,
  });

  final String title;
  final String subtitle;
  final String? btnTitle;
  final String? image;
  final String? secondButtonLabel;
  final VoidCallback? secondButtonOnTap;
  final bool isTwoButton;
  final double? secondButtonWidth;
  final double? firstButtonWidth;
  final VoidCallback ontap;
  final bool showIcon;
  final bool showSecondIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFF313B3A),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(image ?? 'assets/success.png', scale: 2.4),
            const SizedBox(height: 15),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            height(0.01),
            Center(
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: greyColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            isTwoButton
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      MyButton(label: btnTitle ?? 'Continue', onTap: ontap),
                      MyButton(
                        label: secondButtonLabel ?? 'Continue',
                        onTap: secondButtonOnTap!,
                      ),
                    ],
                  )
                : MyButton(label: btnTitle ?? 'Continue', onTap: ontap),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class WarningDialog extends StatelessWidget {
  const WarningDialog({
    super.key,
    required this.ontap,
    required this.title,
    required this.subtitle,
    this.btnTitle,
    this.image,
  });

  final String title;
  final String subtitle;
  final String? btnTitle;
  final String? image;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: mainThemeColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Image.asset(image ?? 'assets/warning.png', height: 60, width: 60),
            const SizedBox(height: 20),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: blackColor.withValues(alpha: 0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            MyButton(label: btnTitle ?? 'Continue', onTap: ontap),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
