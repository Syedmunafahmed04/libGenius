import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:libgenius/Controllers/auth_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/image_widget.dart';
import 'package:libgenius/Widgets/my_appbar.dart';
import 'package:libgenius/Widgets/my_button.dart';

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
              Center(
                child: ClipOval(
                  child: ImageWidget(
                    url: data?.profilePictureUrl ?? '',
                    height: 120,
                    width: 120,
                  ),
                ),
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

              height(0.01),

              // MyButton(
              //   label: 'Update',
              //   onTap: () async {
              //     if (uploadedImage == null) {
              //       myWarningDialog(
              //         title: 'Error',
              //         subtitle: 'Please Upload Image',
              //       );
              //       return;
              //     }

              //     await authController.updateProfileImage(
              //       image: uploadedImage!.path,
              //     );
              //   },
              // ),
            ],
          ),
        );
      }),
    );
  }
}
