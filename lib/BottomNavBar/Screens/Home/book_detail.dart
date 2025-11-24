

// import 'package:flutter/material.dart';

// import 'package:get/route_manager.dart';
// import 'package:libgenius/Global/colors.dart';
// import 'package:libgenius/Global/global.dart';
// import 'package:libgenius/Widgets/my_appbar.dart';

// class JobDetail extends StatefulWidget {
//   const JobDetail({super.key});

//   @override
//   State<JobDetail> createState() => _JobDetailState();
// }

// class _JobDetailState extends State<JobDetail>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//   var ratingController = TextEditingController();

//   // List<String> reviewLeading = [
//   //   'assets/review_icon_1.png',
//   //   'assets/review_icon_2.png',
//   // ];

//   List<String> reviewTitle = ['Abdul Razzaq', 'Antok Godek'];

//   List<String> reviewSubtitle = [
//     'Dr.patricia baik bageet',
//     'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour',
//   ];
//   List<String> reviewTrailing = ['Today', 'Yesterday'];


//   @override
//   void initState() {
//     super.initState();

//     tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     ratingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppbar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: myPadding,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   SizedBox(height: Get.height * 0.35, width: Get.width),
                
//                   SizedBox(
//                     height: Get.height * 0.25,
//                     width: Get.width,
                
//                     child: PageView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 4,
                
//                       itemBuilder: (context, pageIndex) {
//                         int imageNumber = pageIndex + 1;
//                         return Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: AssetImage('assets/book.jpg'),
//                             ),
//                           ),
                
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
                
//                             mainAxisAlignment: MainAxisAlignment.end,
                
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(5),
//                                 margin: EdgeInsets.symmetric(
//                                   vertical: 10,
//                                   horizontal: 10,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: blackColor.withValues(alpha: 0.5),
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Image.asset(
//                                       'assets/camera.png',
//                                       height: 15,
//                                       width: 15,
//                                       color: whiteColor,
//                                     ),
//                                     width(Get.width * 0.01),
//                                     Text(
//                                       '$imageNumber/8',
//                                       style: TextStyle(
//                                         color: whiteColor,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w300,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
                
//                   Positioned(
//                     top: Get.height * 0.28,
//                     left: 0,
//                     right: 0,
                
//                     child: Padding(
//                       padding: EdgeInsets.only(right: 15, left: 15),
                
//                       child: Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 30,
//                             backgroundImage: AssetImage(
//                               'assets/picture.png',
//                             ),
//                           ),
                
//                           Padding(
//                             padding: EdgeInsetsGeometry.symmetric(
//                               horizontal: 10,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'John Smith',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     color: whiteColor,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
                
//                                 Text(
//                                   'Johnsmith@gmail.com',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     color: whiteColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
                
//                           Spacer(),
                
//                           SizedBox(
//                             height: Get.height * 0.04,
//                             width: Get.width * 0.03,
//                             child: Image.asset(
//                               'assets/star.png',
//                               fit: BoxFit.contain,
//                             ),
//                           ),
                
//                           Text(
//                             '(4.9)',
//                             style: TextStyle(
//                               color: Color(0XFFD6D8D8),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 10,
//                     top: Get.height * 0.23,
                
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.transparent,
//                           radius: 20,
//                           foregroundImage: AssetImage('assets/like.png'),
//                         ),
//                         width(Get.width * 0.02),
//                         CircleAvatar(
//                           radius: 20,
//                           backgroundColor: Colors.transparent,
//                           foregroundImage: AssetImage('assets/share.png'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
                
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     height(Get.height * 0.02),
//                     Divider(thickness: 2, color: Color(0XFF131F1D)),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Budget Range',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 20,
//                             color: whiteColor,
//                           ),
//                         ),
//                         Text(
//                           '\$30-\$50',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: whiteColor,
//                           ),
//                         ),
//                       ],
//                     ),
                
//                     height(Get.height * 0.01),
                
//                     Text(
//                       'Ceramic Coating & Polish',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: whiteColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
                
//                     height(Get.height * 0.01),
//                     Text(
//                       'Professional polish + ceramic protection layer. Paint correction included. Ideal for used car resale prep.',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         color: Colors.grey,
//                       ),
//                     ),
                
//                     height(Get.height * 0.015),
                
//                     GestureDetector(
//                       onTap: () {},
                
//                       child: Text(
//                         'Read more',
//                         style: TextStyle(
//                           color: mainThemeColor,
//                           fontWeight: FontWeight.w900,
//                           decoration: TextDecoration.underline,
//                           decorationColor: mainThemeColor,
//                         ),
//                       ),
//                     ),
//                     height(Get.height * 0.005),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           'Posted On: ',
//                           style: TextStyle(
//                             color: whiteColor,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 12,
//                           ),
//                         ),
                
//                         Text(
//                           '25th July, 2025 ',
//                           style: TextStyle(
//                             color: whiteColor,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                     height(Get.height * 0.008),
//                     Divider(color: Color(0xff263130), thickness: 0.5),
//                     Text(
//                       'Contact Information',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 20,
//                         color: whiteColor,
//                       ),
//                     ),
                
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: 10),
//                       padding: myPadding,
//                       decoration: BoxDecoration(
//                         color: Color(0xff1A2523),
//                         borderRadius: BorderRadius.circular(10),
//                         border: BoxBorder.all(
//                           color: Colors.grey.shade700,
//                           width: 1.5,
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 radius: 15,
//                                 backgroundImage: AssetImage(
//                                   'assets/phone.png',
//                                 ),
//                               ),
//                               width(Get.width * 0.01),
//                               Text(
//                                 '123 456 789',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ],
//                           ),
                
//                           height(Get.height * 0.01),
                
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 radius: 15,
//                                 backgroundImage: AssetImage(
//                                   'assets/email.png',
//                                 ),
//                               ),
//                               width(Get.width * 0.01),
//                               Text(
//                                 'johmsmith@gmail.com ',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
                
//                     Divider(color: Color(0xff263130), thickness: 0.5),
                
//                     Text(
//                       'Location',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 20,
//                         color: whiteColor,
//                       ),
//                     ),
//                     Text(
//                       'Torem ipsum dolor sit amet, consectetur adipiscing elit.',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 13,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     height(Get.height * 0.015),
                
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: Image.asset('assets/map.png'),
//                     ),
                
//                     height(Get.height * 0.01),
                
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: 5),
//                       padding: myPadding,
                
//                       decoration: BoxDecoration(
//                         color: Color(0xff192422),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 'Rating (72)',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 18,
//                                   color: whiteColor,
//                                 ),
//                               ),
//                               Spacer(),
//                               CircleAvatar(
//                                 backgroundColor: Colors.transparent,
//                                 radius: 10,
//                                 backgroundImage: AssetImage(
//                                   'assets/half_star.png',
//                                 ),
//                               ),
//                               width(Get.width * 0.015),
                
//                               Text(
//                                 '4.5',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                           height(Get.height * 0.03),
//                           SizedBox(
//                             height: Get.height * 0.3,
//                             child: ListView.separated(
//                               physics: NeverScrollableScrollPhysics(),
//                               separatorBuilder:
//                                   (context, index) =>
//                                       height(Get.height * 0.05),
//                               shrinkWrap: true,
//                               padding: EdgeInsets.zero,
//                               itemCount: reviewLeading.length,
//                               itemBuilder: (context, index) {
//                                 String leading = reviewLeading[index];
//                                 String title = reviewTitle[index];
//                                 String subtitle = reviewSubtitle[index];
//                                 String trailing = reviewTrailing[index];
                
//                                 return SizedBox(
//                                   width: Get.width * 0.9,
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
                
//                                     children: [
//                                       CircleAvatar(
//                                         backgroundColor: Colors.transparent,
//                                         radius: 22,
//                                         child: Image.asset(leading),
//                                       ),
//                                       width(Get.width * 0.03),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             title,
//                                             style: TextStyle(
//                                               color: whiteColor,
//                                               fontSize: 13,
//                                             ),
//                                           ),
//                                           Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               Image.asset(
//                                                 'assets/rating.png',
//                                                 height: 25,
//                                                 width: 80,
//                                               ),
//                                               width(Get.width * 0.02),
//                                               Text(
//                                                 '4.5',
//                                                 style: TextStyle(
//                                                   color: Colors.grey,
//                                                   fontSize: 13,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
                
//                                           SizedBox(
//                                             width: Get.width * 0.5,
//                                             child: Text(
//                                               subtitle,
                
//                                               style: TextStyle(
//                                                 fontSize: 11,
//                                                 color: whiteColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Spacer(),
//                                       Text(
//                                         trailing,
//                                         style: TextStyle(
//                                           color: whiteColor,
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
                   
//                     height(Get.height * 0.02),
//                     Divider(color: Colors.grey, thickness: 0.5),
                
//                     height(Get.height * 0.01),
                
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/flag.png',
//                           height: 20,
//                           width: 20,
//                         ),
                
//                         width(Get.width * 0.01),
                
//                         Text(
//                           'Report This Ad',
//                           style: TextStyle(
//                             color: whiteColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     height(Get.height * 0.01),
//                     Divider(color: Colors.grey, thickness: 0.5),
                
//                     height(Get.height * 0.02),
                
//                     Text(
//                       'All Jobs',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: whiteColor,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     height(Get.height * 0.02),
                
//                     SizedBox(
//                       height: Get.height * 0.31,
//                       width: double.infinity,
                
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 5,
                
//                         itemBuilder: (context, index) {
//                           return Container(
//                             padding: EdgeInsets.symmetric(horizontal: 10),
                
//                             margin: EdgeInsets.only(right: 10),
//                             width: Get.width * 0.5,
//                             decoration: BoxDecoration(
//                               color: Color(0XFF313B3A),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
                
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: Get.height * 0.18,
//                                   width: Get.width * 1,
                
//                                   child: Image.asset(
//                                     'assets/job.png',
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       'Car Wrapping',
//                                       style: TextStyle(
//                                         color: whiteColor,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                     Spacer(),
                
//                                     SizedBox(
//                                       height: Get.height * 0.04,
//                                       width: Get.width * 0.03,
//                                       child: Image.asset(
//                                         'assets/star.png',
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                     width(Get.width * 0.01),
//                                     Text(
//                                       '(4.9)',
//                                       style: TextStyle(
//                                         color: Color(0XFFD6D8D8),
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
                
//                                 Container(
//                                   height: Get.height * 0.02,
//                                   width: Get.width * 0.253,
//                                   decoration: BoxDecoration(
//                                     color: Color(0XfFF3BF2D),
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: FittedBox(
//                                     fit: BoxFit.scaleDown,
//                                     child: Text(
//                                       ' BMW E90 · 2011 · Silver',
//                                       style: TextStyle(
//                                         color: blackColor,
//                                         fontSize: 6,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 height(Get.height * 0.005),
//                                 Text(
//                                   'Budget Range',
//                                   style: TextStyle(
//                                     color: Color(0XFFD6D8D8),
//                                     fontSize: 13,
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       '\$12.45',
//                                       style: TextStyle(
//                                         color: Color(0XFFD6D8D8),
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     width(Get.width * 0.18),
//                                     SizedBox(
//                                       height: Get.height * 0.035,
//                                       width: Get.width * 0.125,
//                                       child: Image.asset(
//                                         'assets/forward.png',
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
                
//                     height(Get.height * 0.02),
                
//                     Text(
//                       'General Safety Tips',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: whiteColor,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     height(Get.height * 0.01),
                
//                     Text(
//                       """
//         • Trust your instincts — if something feels “off,” cancel the
//           deal.
//         • Report suspicious users or activities immediately.
//         • Use the platform’s chat system instead of moving to
//           external apps (like WhatsApp) too soon.""",
//                       textAlign: TextAlign.justify,
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 13,
//                       ),
//                     ),
                
//                     height(Get.height * 0.02),
                
//                     MyButton(
//                       ontap: () {
//                         Get.to(() => ChatScreen());
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/chat2.png',
//                             height: 20,
//                             width: 20,
//                           ),
//                           width(Get.width * 0.01),
//                           Text(
//                             'Chat',
//                             style: TextStyle(fontWeight: FontWeight.w900),
//                           ),
//                         ],
//                       ),
//                     ),
                
//                     height(Get.height * 0.04),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }