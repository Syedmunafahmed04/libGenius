import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_appbar.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  List<PopupMenuItem<String>> popupItems = [
    PopupMenuItem(value: 'fines', child: Text('Sort By Fines')),
    PopupMenuItem(value: 'reset', child: Text('Reset')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: 'My History',

        trailing: PopupMenuButton<String>(
          color: whiteColor,
          iconColor: whiteColor,
          onSelected: (value) {
            myPrint(value);
          },
          itemBuilder: (context) => popupItems,
        ),
      ),
      body: SingleChildScrollView(
        padding: myPadding,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.yellow.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Only books issued within 1 month will be shown here',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: whiteColor,
                ),
              ),
            ),
            height(0.01),
            ListView.separated(
              separatorBuilder: (context, index) {
                return height(0.01);
              },
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return Container(
                  padding: myPadding,
                  decoration: BoxDecoration(
                    color: Color(0XFF313B3A),

                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/book2.jpeg',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          width(0.02),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width * 0.3,
                                padding: EdgeInsets.symmetric(
                                  vertical: 3,
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: mainThemeColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    'Sealed Necter',
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              height(0.005),
                              SizedBox(
                                width: Get.width * 0.5,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  'Safiur Rahman Mubarakpuri',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      index % 2 == 0 ? height(0.02) : SizedBox.shrink(),

                      index % 2 == 0
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 1,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(15),
                              ),

                              child: Text(
                                'Fined: 100 Rs',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: whiteColor,
                                ),
                              ),
                            )
                          : SizedBox.shrink(),

                      height(0.02),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: mainThemeColor.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Text(
                              'Issued On: 01/10/2022',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: whiteColor,
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Text(
                              'Returned On: 15/10/2022',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
