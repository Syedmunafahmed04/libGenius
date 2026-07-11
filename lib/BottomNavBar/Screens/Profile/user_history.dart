import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:libgenius/Controllers/book_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/image_widget.dart';
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
  final bookController = Get.put(BookController());

  Future<void> myInit() async {
    await bookController.getIssuedBooks();
    await bookController.getUserHistory();
  }

  @override
  void initState() {
    super.initState();
    myInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: 'My History',

        // trailing: PopupMenuButton<String>(
        //   color: whiteColor,
        //   iconColor: whiteColor,
        //   onSelected: (value) {
        //     myPrint(value);
        //   },
        //   itemBuilder: (context) => popupItems,
        // ),
      ),

      body: Obx(() {
        final allHistory = bookController.historyModel.value.history;
        final issuedBooks = bookController.issueModel.value.issuedBooks;

        if (allHistory == null) {
          return Center(
            child: CircularProgressIndicator(color: mainThemeColor),
          );
        }

        // Collect all issueIds from currently issued books
        final issuedIssueIds = (issuedBooks ?? [])
            .map((e) => e.issueId)
            .whereType<int>()
            .toSet();

        // Filter out history items that are currently issued
        final data = allHistory
            .where(
              (h) => h.issueId == null || !issuedIssueIds.contains(h.issueId),
            )
            .toList();

        if (data.isEmpty) {
          return Center(
            child: Text(
              'No Data Found',
              style: TextStyle(color: whiteColor, fontSize: 14),
            ),
          );
        }

        return SingleChildScrollView(
          padding: myPadding,
          child: Column(
            children: [
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
              //   decoration: BoxDecoration(
              //     color: Colors.yellow.withValues(alpha: 0.3),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Text(
              //     'Only books issued within 1 month will be shown here',
              //     style: TextStyle(
              //       fontWeight: FontWeight.w400,
              //       fontSize: 13,
              //       color: whiteColor,
              //     ),
              //   ),
              // ),
              // height(0.01),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return height(0.01);
                },
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  final item = data[index];
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
                              child: ImageWidget(
                                url: item.book?.bookCoverPage ?? '',
                                height: 50,
                                width: 50,
                              ),
                            ),
                            width(0.02),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: Get.width * 0.4,
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
                                      maxLines: 2,
                                      item.book?.title ?? 'N/A',
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
                                    'By: ${item.book?.author ?? 'N/A'}',
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

                        ((item.fineTableAmount ?? 0) > 0)
                            ? height(0.02)
                            : SizedBox.shrink(),

                        ((item.fineTableAmount ?? 0) > 0)
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
                                  'Fined: ${item.fineTableAmount ?? 0} Rs',
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
                                'Issued On: ${DateFormat('dd/MM/yyyy').format(item.issueDate ?? DateTime.now())}',
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
                                 // item.returnDate == null
                                    // ? 'Not Returned'
                                    // : 'Returned On: ${DateFormat('dd MMM, yyyy').format(item.returnDate ?? DateTime.now())}',
                                item.returnDate == null
                                    ? 'Not Returned'
                                    : 'Returned On: ${DateFormat('dd MMM, yyyy').format(item.returnDate ?? DateTime.now())}',
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
        );
      }),
    );
  }
}
