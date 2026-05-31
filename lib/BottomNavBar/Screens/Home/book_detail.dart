import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:libgenius/Controllers/book_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Models/books_model.dart';
import 'package:libgenius/Widgets/image_widget.dart';
import 'package:libgenius/Widgets/my_button.dart';
import 'package:libgenius/Widgets/my_textfield.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetail extends StatefulWidget {
  final Book bookData;
  const BookDetail({super.key, required this.bookData});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  final ratingController = TextEditingController();
  final bookController = Get.put(BookController());
  final formKey = GlobalKey<FormState>();
  int reviewStars = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ratings = widget.bookData.review
        ?.map((e) => e.ratingStarNumber)
        .toList();

    int totalStars = 0;
    double avgRatings = 0;

    if (ratings != null) {
      for (var rating in ratings) {
        totalStars += rating!;
      }
      if (totalStars != 0) {
        avgRatings = totalStars / ratings.length;
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImageWidget(
                  url: '${widget.bookData.bookCoverPage}',
                  height: Get.height * 0.35,
                  width: Get.width,
                  fit: BoxFit.contain,
                ),

                Positioned(
                  top: Get.height * 0.06,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: whiteColor,

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            offset: Offset(0, 1),
                            spreadRadius: 1,
                            color: blackColor.withValues(alpha: 0.1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: blackColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                      Text(
                        widget.bookData.title ?? 'N/A',
                        style: categoriesHeadingStyle,
                      ),
                    ],
                  ),

                  height(0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Availability: ${widget.bookData.quantity ?? 'N/A'}',
                        style: TextStyle(
                          fontSize: 13,
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

                                TextSpan(
                                  text:
                                      '(${widget.bookData.review?.length ?? '0'})',
                                ),
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
                            '$avgRatings',
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
                  height(0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Islamic History', //TODO
                        style: TextStyle(
                          fontWeight: FontWeight.w600,

                          color: whiteColor.withValues(alpha: 0.8),
                        ),
                      ),

                      GestureDetector(
                        onTap: () async {
                          if (widget.bookData.bookPdfUrl != null &&
                              widget.bookData.bookPdfUrl!.isNotEmpty) {
                            final url = Uri.parse(widget.bookData.bookPdfUrl!);
                            if (await canLaunchUrl(url)) {
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              myWarningDialog(
                                title: 'Error',
                                subtitle: 'Could not open the PDF',
                                btnTitle: 'Continue',
                                ontap: () {
                                  Get.back();
                                },
                              );
                            }
                          } else {
                            myWarningDialog(
                              title: 'Alert',
                              subtitle: 'PDF link not available for this book',
                              btnTitle: 'Continue',
                              ontap: () {
                                Get.back();
                              },
                            );
                          }
                        },
                        child: Icon(
                          Icons.file_download_outlined,
                          color: whiteColor,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  height(0.01),

                  Text(
                    widget.bookData.description ?? 'N/A',
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
            widget.bookData.review?.length == 0
                ? SizedBox.shrink()
                : ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return height(0.01);
                    },
                    itemCount: widget.bookData.review!.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final review = widget.bookData.review![index];
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
                                  child: ImageWidget(
                                    url: '${review.users?.profilePictureUrl}',
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                width(0.015),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      review.users?.studentName ?? 'N/A',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: whiteColor.withValues(
                                          alpha: 0.7,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          allowHalfRating: false,
                                          initialRating: double.parse(
                                            review.ratingStarNumber.toString(),
                                          ),
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
                                          '(${review.ratingStarNumber})',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: whiteColor.withValues(
                                              alpha: 0.6,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            height(0.01),

                            Text(
                              review.ratingDescription ?? 'N/A',
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
            height(0.01),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: MyButton(
                label: 'Rate',
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: StatefulBuilder(
                        builder: (context, state) {
                          return Container(
                            decoration: BoxDecoration(
                              color: scaffoldBackgroundColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15),

                            height: Get.height * 0.4,

                            child: SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    height(0.01),
                                    Text(
                                      'Rate',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: whiteColor,
                                      ),
                                    ),

                                    height(0.015),

                                    RatingBar.builder(
                                      glow: false,
                                      allowHalfRating: false,
                                      itemSize: 35,

                                      minRating: 1,
                                      unratedColor: Color(0xffD9D9D9),
                                      onRatingUpdate: (value) {
                                        reviewStars = value.toInt();

                                        myPrint(reviewStars);
                                      },
                                      itemBuilder: (context, index) {
                                        return Icon(
                                          Icons.star_rounded,

                                          color: Color(0xffFFA600),
                                        );
                                      },
                                    ),
                                    height(0.015),

                                    MyTextField(
                                      borderRadius: 15,
                                      maxLines: 4,
                                      controller: ratingController,
                                      validation: (p0) {
                                        if (p0!.isEmpty) {
                                          return 'Please enter a review';
                                        }
                                        return null;
                                      },
                                      hintText: 'Write a review..',
                                    ),
                                    height(0.01),
                                    MyButton(
                                      label: 'Submit',
                                      onTap: () async {
                                        if (formKey.currentState!.validate()) {
                                          bookController.submitReview(
                                            bookId: widget.bookData.bookId
                                                .toString(),
                                            ratings: reviewStars.toString(),
                                            reviews: ratingController.text,
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
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
