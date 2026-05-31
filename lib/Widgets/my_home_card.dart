import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Models/books_model.dart';
import 'package:libgenius/Widgets/image_widget.dart';


class MyHomeCard extends StatefulWidget {
  final VoidCallback onTap;
  final Book bookData;
  const MyHomeCard({super.key, required this.onTap, required this.bookData});

  @override
  State<MyHomeCard> createState() => _MyHomeCardState();
}

class _MyHomeCardState extends State<MyHomeCard> {
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
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: Get.width * 0.5,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),

        decoration: BoxDecoration(
          color: Color(0XFF313B3A),
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ImageWidget(
                url: '${widget.bookData.bookCoverPage}',
                fit: BoxFit.cover,
                height: Get.height * 0.12,
                width: Get.width * 0.45,
              ),
            ),
            height(0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * 0.3,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                  decoration: BoxDecoration(
                    color: mainThemeColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                     widget.bookData.title??'N/A',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/star.png',
                      fit: BoxFit.contain,
                      height: 12,
                      width: 12,
                    ),
                    width(0.01),
                    Text(
                      '($avgRatings)',
                      style: TextStyle(color: whiteColor, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            height(0.005),
            SizedBox(
              width: Get.width * 0.4,
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                widget.bookData.author??'N/A',
                style: TextStyle(
                  color: Color(0XFFD6D8D8),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            height(0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Islamic History', //TODO
                  style: TextStyle(color: whiteColor, fontSize: 13),
                ),

                Icon(Icons.arrow_forward, size: 16, color: whiteColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
