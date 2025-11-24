import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';

height(height) {
  return SizedBox(height: height * Get.height);
}

width(width) {
  return SizedBox(width: width * Get.width);
}

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
