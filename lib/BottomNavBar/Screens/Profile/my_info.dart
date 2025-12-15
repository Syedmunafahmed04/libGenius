import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_appbar.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  File? uploadedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'My Information'),

      body: Padding(
        padding: myPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(height: Get.height * 0.1),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      await pickImage(ImageSource.gallery).then((value) {
                        setState(() {
                          uploadedImage = value;
                        });
                      });
                    },
                    child: uploadedImage != null
                        ? ClipOval(
                            child: Image.file(
                              uploadedImage!,
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipOval(
                            child: Image.asset(
                              'assets/men.jpg',
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),

                Positioned(
                  bottom: Get.height * 0.003,

                  right: Get.width * 0.36,
                  child: GestureDetector(
                    onTap: () async {
                      await pickImage(ImageSource.gallery).then((value) {
                        setState(() {
                          uploadedImage = value;
                        });
                      });
                    },
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: mainThemeColor,

                      child: Image.asset(
                        'assets/edit2.png',
                        height: 14,
                        width: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            height(0.01),
            Text(
              'Name',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: whiteColor,
              ),
            ),
            Text(
              'John Doe',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: greyColor,
              ),
            ),
            height(0.02),

            Text(
              'CMS ID',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: whiteColor,
              ),
            ),

            Text(
              '1763-2022',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: greyColor,
              ),
            ),

            height(0.02),
            Text(
              'Email',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: whiteColor,
              ),
            ),

            Text(
              'johndoe55@gmail.com',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: greyColor,
              ),
            ),

            height(0.02),

            Text(
              'Program',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: whiteColor,
              ),
            ),

            Text(
              'BSCS- 7 Semester (Fall 2022)',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: greyColor,
              ),
            ),

            height(0.02),

            Text(
              'Campus',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: whiteColor,
              ),
            ),

            Text(
              'Main Campus',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
