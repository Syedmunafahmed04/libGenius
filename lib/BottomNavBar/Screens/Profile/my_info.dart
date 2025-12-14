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
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipOval(
                            child: Image.asset(
                              'assets/john.png',
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),

                Positioned(
                  bottom: Get.height * 0.006,

                  right: Get.width * 0.38,
                  child: GestureDetector(
                    onTap: () async {
                      await pickImage(ImageSource.gallery).then((value) {
                        setState(() {
                          uploadedImage = value;
                        });
                      });
                    },
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: mainThemeColor,

                      child: Image.asset(
                        'assets/edit2.png',
                        height: 12,
                        width: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            height(0.02),
            Center(child: myDefaultText('John Doe')),
            height(0.01),

            Text(
              'CMS ID',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: blackColor,
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
                color: blackColor,
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
                color: blackColor,
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
                color: blackColor,
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
