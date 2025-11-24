import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_home_card.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  // final List<String> recents = ['Pizza', 'Burger', 'Cola', 'Paratha'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(0.03),
          Padding(
            padding: myPaddingTop,
            child: Row(
              children: [
                // GestureDetector(
                //   onTap: Get.back,

                //   child: Container(
                //     margin: EdgeInsets.only(right: 5),
                //     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                //     decoration: BoxDecoration(
                //       color: whiteColor,
                //       boxShadow: [
                //         BoxShadow(
                //           blurRadius: 1,
                //           offset: Offset(0, 1),
                //           spreadRadius: 1,
                //           color: blackColor.withValues(alpha: 0.1),
                //         ),
                //       ],
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child:
                //   Icon(Icons.arrow_back,color: whiteColor,)
                //     // Image.asset('assets/back_arrow.png', scale: 1.8),

                //   ),
                // ),
                Expanded(
                  child: MyTextField(
                    height: Get.height * 0.06,
                    leading: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Icon(Icons.search, color: whiteColor),

                      // Image.asset(
                      //   'assets/search.png',
                      //   height: 20,
                      //   width: 20,
                      // ),
                    ),

                    hintText: 'Search your book',
                    controller: searchController,
                  ),
                ),
                width(0.02),

                GestureDetector(
                  onTap: () {
                    // Get.to(() => MenuFilter());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: scaffoldBackgroundColor.withValues(alpha: 0.4),
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
                    child: Icon(Icons.tune_rounded, color: whiteColor),

                    // Image.asset(
                    //   'assets/filter.png',
                    //   height: 25,
                    //   width: 25,
                    // ),
                  ),
                ),
              ],
            ),
          ),

          // recents.isEmpty
          //     ? SizedBox()
          //     : Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 15),
          //         child: Text('Recent Searches', style: categoriesHeadingStyle),
          //       ),
          // recents.isEmpty ? SizedBox() : height(0.01),

          // ListView.builder(
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   padding: EdgeInsets.symmetric(horizontal: 15),
          //   itemCount: recents.length,
          //   itemBuilder: (context, index) {
          //     String recent = recents[index];

          //     return Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text(
          //           recent,
          //           style: TextStyle(
          //             fontWeight: FontWeight.w400,
          //             fontSize: 13,
          //             color: greyColor,
          //           ),
          //         ),

          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               recents.remove(recent);
          //             });
          //           },
          //           child: Icon(Icons.close, color: greyColor, size: 18),
          //         ),
          //       ],
          //     );
          //   },
          // ),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: Get.height * 0.0011,

                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                // final item = allItems[index];
                return MyHomeCard(onTap: () {});

                // MyMenuGridCard(
                //   item: item,
                //   onTap: () {
                //     Get.to(() => MenuDetail());
                //   },
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
