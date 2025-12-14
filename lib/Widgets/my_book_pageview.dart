import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';

class MyBookPageView extends StatefulWidget {
  const MyBookPageView({super.key});

  @override
  State<MyBookPageView> createState() => _MyBookPageViewState();
}

class _MyBookPageViewState extends State<MyBookPageView> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          height: Get.height * 0.35,
          width: Get.width,
          child: PageView.builder(
            itemCount: 3,

            itemBuilder: (context, index) {
              return Image.asset('assets/book2.jpeg', fit: BoxFit.cover);
            },
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
          ),
        ),

        Positioned(
          top: Get.height * 0.05,
          left: 10,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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

        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: SizedBox(
              height: Get.height * 0.016,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    width: 25,
                    decoration: BoxDecoration(
                      color: mainThemeColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: pageIndex == index
                            ? whiteColor
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
