import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Auth/change_password.dart';
import 'package:libgenius/Auth/login_page.dart';
import 'package:libgenius/BottomNavBar/Screens/Profile/about_us.dart';
import 'package:libgenius/BottomNavBar/Screens/Profile/privacy_policy.dart';
import 'package:libgenius/BottomNavBar/Screens/Profile/terms_conditions.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_appbar.dart';
import 'package:libgenius/Widgets/my_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Profile', isBack: false),

      body: SingleChildScrollView(
        padding: myPadding,
        child: Column(
          children: [
            Center(
              child: ClipOval(
                child: Image.asset('assets/men.jpg', height: 50, width: 50),
              ),
            ),

            height(0.02),

            Card(
              color: whiteColor,

              elevation: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.to(() => EditProfile());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/profile2.png',
                            height: 20,
                            width: 20,
                          ),
                          width(0.02),
                          Text(
                            'My Profile',
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    height(0.02),

                    GestureDetector(
                      onTap: () {
                        Get.to(() => UpdatePassword());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/security.png',
                            height: 22,
                            width: 18,
                          ),
                          width(0.025),
                          Text(
                            'Security',
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              color: whiteColor,

              elevation: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          // Image.asset(
                          //   'assets/orders.png',
                          //   height: 22,
                          //   width: 23,
                          // ),
                          width(0.017),
                          Text(
                            'My Books',
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),

                    height(0.02),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          // Image.asset(
                          //   'assets/transaction_history.png',
                          //   height: 21,
                          //   width: 21,
                          // ),
                          width(0.02),
                          Text(
                            'History',
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),

                    height(0.02),

                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          // Image.asset(
                          //   'assets/orders.png',
                          //   height: 22,
                          //   width: 23,
                          // ),
                          width(0.017),
                          Text(
                            'Fines',
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              color: whiteColor,

              elevation: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => PrivacyPolicy());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/privacy.png',
                            height: 22,
                            width: 26,
                          ),
                          width(0.012),
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    height(0.02),

                    GestureDetector(
                      onTap: () {
                        Get.to(() => TermsConditions());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/terms.png',
                            height: 22,
                            width: 23,
                          ),
                          width(0.017),
                          Text(
                            'Terms & Conditions',
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    height(0.02),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AboutUs());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/about.png',
                            height: 24,
                            width: 25,
                          ),
                          width(0.012),
                          Text(
                            'About Us',
                            style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            height(0.01),

            MyButton(
              label: 'Logout',
              onTap: () {
                myAlertDialog(
                  title: 'Logout',
                  content: 'Are you sure to logout',
                  onTap: () {
                    Get.offAll(() => LoginPage());
                  },
                );

                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       backgroundColor: whiteColor,
                //       title: Text(
                //         'Logout',
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //       content: Text(
                //         'Are you sure you want to logout your account?',
                //         style: TextStyle(fontWeight: FontWeight.w500),
                //       ),
                //       actions: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             GestureDetector(
                //               child: Text(
                //                 'Cancel',
                //                 style: TextStyle(
                //                   color: blackColor,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               onTap: () {
                //                 Get.back();
                //               },
                //             ),
                //             width(0.03),
                //             GestureDetector(
                //               child: Text(
                //                 'Logout',
                //                 style: TextStyle(
                //                   color: Color(0xffC02929),
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               onTap: () async {
                //                 box.remove('user');
                //                 myLoadingDialog();
                //                 await Future.delayed(Duration(seconds: 1));
                //                 Get.back();
                //                 Get.offAll(() => LoginPage());
                //               },
                //             ),
                //           ],
                //         ),
                //       ],
                //     );
                //   },
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
