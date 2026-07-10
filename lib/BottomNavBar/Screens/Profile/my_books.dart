import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:libgenius/Controllers/book_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/image_widget.dart';
import 'package:libgenius/Widgets/my_appbar.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  final bookController = Get.put(BookController());

  Future<void> getBooks() async {
    await bookController.getIssuedBooks();
  }

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'My Books'),
      body: Obx(() {
        final data = bookController.issueModel.value.issuedBooks;

        if (data == null) {
          return Center(
            child: CircularProgressIndicator(color: mainThemeColor),
          );
        }

        if (data.isEmpty) {
          return Center(child: myDefaultText('No Issued Books Found'));
        }
        return SingleChildScrollView(
          padding: myPadding,
          child: ListView.separated(
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
                            fit: BoxFit.cover,
                          ),
                        ),
                        width(0.02),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.5,
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
                            'Issued On: ${DateFormat('dd MMM, yyyy').format(item.issueDate!.toLocal())}',
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
                            'Due Date: ${DateFormat('dd MMM, yyyy').format(item.dueDate!.toLocal())}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // height(0.02),

                    // MyButton(
                    //   buttonColor: Colors.red.shade900,
                    //   fontSize: 14,
                    //   label: 'Drop Book',
                    //   onTap: () {
                    //     myAlertDialog(
                    //       title: 'Drop Book',
                    //       content:
                    //           'Are you sure to drop ${item.book?.title ?? 'N/A'} ?',
                    //       onTap: () {
                    //         Get.back();

                    //       },
                    //     );
                    //   },
                    // ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
