import 'package:flutter/material.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_appbar.dart';
import 'package:libgenius/Widgets/my_button.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'My Books'),
      body: SingleChildScrollView(
        padding: myPadding,
        child: Column(
          children: [
            ListView.builder(
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
                              'assets/book2.jpg',
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          width(0.02),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1,
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: mainThemeColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: FittedBox(
                                  child: Text(
                                    'Sealed Necter',
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              height(0.01),
                              Text(
                                'Safiur Rahman Mubarakpuri',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      height(0.02),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: mainThemeColor.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Text(
                              'Issued On: 01/10/2022',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: whiteColor,
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Text(
                              'Due Date: 15/10/2022',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      height(0.02),

                      MyButton(
                        label: 'Drop Book',
                        onTap: () {
                          mySuccessDialog(
                            title: 'Dropped Successfully!',
                            subtitle: '',
                          );
                        },
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
