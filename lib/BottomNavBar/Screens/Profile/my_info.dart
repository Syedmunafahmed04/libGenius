import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:libgenius/Controllers/auth_controller.dart';
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
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'My Information'),

      body: Obx(() {
        final data = userModel.value.studentData;

        return Padding(
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
                      child: 
                      
                      
                      
                      uploadedImage != null
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
                data?.studentName ?? 'N/A',
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
                data?.cmsId ?? 'N/A',
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
                data?.email ?? 'N/A',
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
                '${data?.department} ${data?.semester} Semester',
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
                data?.campus ?? 'N/A',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: greyColor,
                ),
              ),
              height(0.02),

              Text(
                'Phone',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: whiteColor,
                ),
              ),

              Text(
                data?.phoneNo ?? 'N/A',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: greyColor,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
