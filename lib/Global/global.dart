import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:image_picker/image_picker.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Models/user_model.dart';
import 'package:libgenius/Widgets/loading_dialog.dart';
import 'package:libgenius/Widgets/my_dialog.dart';

height(height) {
  return SizedBox(height: height * Get.height);
}

width(width) {
  return SizedBox(width: width * Get.width);
}

GetStorage box = GetStorage();
Rx<UserModel> userModel = UserModel().obs;
const myPadding = EdgeInsets.all(10);
const myPaddingTop = EdgeInsets.only(left: 15, right: 15, top: 15);
const myPaddingBottom = EdgeInsets.only(left: 15, right: 15, bottom: 15);

final categoriesHeadingStyle = TextStyle(
  color: whiteColor,
  fontSize: 16,
  fontWeight: FontWeight.w800,
);

final authHeadingStyle = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: 20,
  color: whiteColor,
);

myLoadingDialog({String? title, bool showLoader = false}) {
  showDialog(
    barrierDismissible: showLoader,
    context: Get.context!,
    builder: (context) {
      return LoadingDialog(message: title ?? "Loading");
    },
  );
}

AccessCredentials? credentials;
String fcmAccessToken = '';
String fcmToken = '';

mySnackBar({required String title, required String message, int duration = 1}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: mainThemeColor,
    colorText: whiteColor,
    animationDuration: Duration(seconds: duration),

    margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
    duration: Duration(seconds: 2),
  );
}

Widget myDefaultText(String text, [double? fontSize]) {
  return Text(
    overflow: TextOverflow.ellipsis,

    text,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 14,
      color: whiteColor,
    ),
  );
}

myPrint(value) {
  if (kDebugMode) {
    print(value);
  }
}

Future<File?> pickImage([ImageSource? source]) async {
  final pickedFile = await ImagePicker().pickImage(
    source: source ?? ImageSource.gallery,
  );
  if (pickedFile != null) {
    File image = File(pickedFile.path);
    return image;
  } else {
    return null;
  }
}

mySuccessDialog({
  required String title,
  required String subtitle,
  VoidCallback? ontap,
  String? btnTitle,
  bool showIcon = false,
  bool showSecondIcon = false,
  String? image,

  final String? secondButtonLabel,
  VoidCallback? secondButtonOnTap,
  bool isTwoButton = false,
  double? secondButtonWidth,
  double? firstButtonWidth,
}) {
  return showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 15),
        child: SuccessDialog(
          title: title,
          subtitle: subtitle,
          btnTitle: btnTitle,
          image: image,
          ontap:
              ontap ??
              () {
                Get.back();
              },
          firstButtonWidth: firstButtonWidth,
          secondButtonLabel: secondButtonLabel,
          isTwoButton: isTwoButton,
          secondButtonOnTap: secondButtonOnTap,
          secondButtonWidth: secondButtonWidth,
          showIcon: showIcon,
          showSecondIcon: showSecondIcon,
        ),
      );
    },
  );
}

myWarningDialog({
  required String title,
  required String subtitle,
  void Function()? ontap,
  String? btnTitle,
  String? secondBtnTitle,
  String? image,
  bool? secondButton,
  void Function()? secondOnTap,
}) {
  return showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 15),
        child: WarningDialog(
          title: title,
          subtitle: subtitle,
          btnTitle: btnTitle,
          image: image,
          ontap:
              ontap ??
              () {
                Get.back();
              },
        ),
      );
    },
  );
}

Future<dynamic> myAlertDialog({
  required String title,
  required String content,
  required VoidCallback onTap,
}) {
  return showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        content: Text(content),
        actions: [
          TextButton(
            child: Text('No', style: TextStyle(color: mainThemeColor)),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            onPressed: onTap,
            child: Text('Yes', style: TextStyle(color: Colors.red.shade800)),
          ),
        ],
      );
    },
  );
}
