import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_book_pageview.dart';
import 'package:libgenius/Widgets/my_button.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({super.key});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  final ratingController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyBookPageView(),
            height(0.01),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: myPadding,
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sealed Necter', style: categoriesHeadingStyle),

                      // MyOptionSelection(
                      //   borderRadius: 25,
                      //   padding: EdgeInsets.symmetric(
                      //     vertical: 2,
                      //     horizontal: 10,
                      //   ),
                      //   color: Color(0xffFFDE5F),
                      //   text: '\$11.00',
                      //   textColor: whiteColor,
                      // ),
                    ],
                  ),

                  height(0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Availability: 4',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: whiteColor.withValues(alpha: 0.7),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Text.rich(
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: whiteColor.withValues(alpha: 0.7),
                            ),
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Reviews',
                                  style: TextStyle(
                                    // fontFamily: poppins,
                                    decoration: TextDecoration.underline,
                                    decorationColor: whiteColor.withValues(
                                      alpha: 0.7,
                                    ),

                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor.withValues(alpha: 0.7),
                                  ),
                                ),

                                TextSpan(text: '(45)'),
                              ],
                            ),
                          ),
                          width(0.01),

                          Icon(
                            Icons.star_rounded,
                            color: Color(0xffFFA600),
                            size: 15,
                          ),

                          width(0.01),

                          Text(
                            '4',
                            style: TextStyle(
                              // fontFamily: poppins,
                              fontWeight: FontWeight.w600,
                              color: whiteColor,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  height(0.01),
                  Text(
                    'Islamic History',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,

                      color: whiteColor.withValues(alpha: 0.8),
                    ),
                  ),
                  height(0.01),

                  Text(
                    'sdvQorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. ipsum dolor sit amet, consectetur adipiscing',
                    style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),

                  // MyButton(
                  //   label: 'Get Now',
                  //   fontSize: 14,
                  //   onTap: () {
                  //     myAlertDialog(
                  //       title: 'Get This Book',
                  //       content:
                  //           'By tapping on yes you confirm to get this book',
                  //       onTap: () {
                  //         mySuccessDialog(
                  //           title: 'Request Sent!',
                  //           subtitle: 'Your book request has been sent ',
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),

            height(0.01),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return height(0.01);
              },
              itemCount: 2,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: myPadding,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/men.jpg',
                              height: 45,
                              width: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                          width(0.015),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mark Jacob',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: whiteColor.withValues(alpha: 0.7),
                                ),
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    allowHalfRating: false,
                                    initialRating: 3,
                                    ignoreGestures: true,
                                    glow: false,
                                    itemSize: 16,
                                    itemPadding: EdgeInsets.zero,
                                    minRating: 1,
                                    unratedColor: Color(0xffD9D9D9),
                                    onRatingUpdate: (value) {},
                                    itemBuilder: (context, index) {
                                      return Icon(
                                        Icons.star_rounded,
                                        color: Color(0xffFFA600),
                                      );
                                    },
                                  ),

                                  width(0.01),

                                  Text(
                                    '(4)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: whiteColor.withValues(alpha: 0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      // height(0.02),
                      // Text(
                      //   'History, Catupiray',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w600,

                      //     color: whiteColor.withValues(alpha: 0.8),
                      //   ),
                      // ),
                      height(0.01),

                      Text(
                        'sdvQorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. ipsum dolor sit amet, consectetur adipiscing',
                        style: TextStyle(
                          color: greyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            // height(0.03),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: Text('Related Books', style: categoriesHeadingStyle),
            // ),
            // height(0.01),

            // SizedBox(
            //   height: Get.height * 0.23,
            //   child: ListView.separated(
            //     separatorBuilder: (context, index) {
            //       return width(0.02);
            //     },
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 5,
            //     padding: EdgeInsets.symmetric(horizontal: 15),
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) {
            //       return MyHomeCard(onTap: () {});
            //     },
            //   ),
            // ),
            height(0.02),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: MyButton(
                label: 'Rate',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            color: scaffoldBackgroundColor,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15),

                          height: Get.height * 0.4,

                          child: Column(
                            children: [
                              height(0.01),
                              Text(
                                'Rating',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: whiteColor,
                                ),
                              ),

                              height(0.02),

                              RatingBar.builder(
                                glow: false,
                                allowHalfRating: false,
                                itemSize: 35,

                                minRating: 1,
                                unratedColor: Color(0xffD9D9D9),
                                onRatingUpdate: (value) {},
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star_rounded,

                                    color: Color(0xffFFA600),
                                  );
                                },
                              ),
                              height(0.015),

                              MyTextField(
                                controller: ratingController,
                                maxLines: 5,

                                hintText: 'Type Your Text...',
                              ),
                              height(0.01),
                              MyButton(
                                label: 'Submit',
                                onTap: () {
                                  mySuccessDialog(
                                    title: 'Review Submitted!',
                                    subtitle:
                                        'Your review has been submitted successfully',
                                    ontap: () {
                                      ratingController.clear();
                                      Get.close(2);
                                    },
                                  );
                                },
                              ),
                              height(0.01),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
