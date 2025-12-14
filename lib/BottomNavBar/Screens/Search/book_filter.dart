import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_appbar.dart';
import 'package:libgenius/Widgets/my_button.dart';
import 'package:libgenius/Widgets/my_dropdown.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class BookFilter extends StatefulWidget {
  const BookFilter({super.key});

  @override
  State<BookFilter> createState() => _BookFilterState();
}

class _BookFilterState extends State<BookFilter> {
  final bookController = TextEditingController();
  final authorController = TextEditingController();

  final categoryController = TextEditingController();

  String? ratingValue;
  List<String> ratingsList = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Filter'),

      body: SingleChildScrollView(
        padding: myPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myDefaultText('Search By Book'),
            MyTextField(hintText: '', controller: bookController),
            height(0.02),

            myDefaultText('Search By Author'),
            MyTextField(hintText: '', controller: bookController),
            height(0.02),

            myDefaultText('Search By Category'),
            MyTextField(hintText: '', controller: bookController),
            height(0.02),

            myDefaultText('Search By Rating'),

            MyDropDown(
              dropdownvalue: ratingValue,

              hintText: '',
              items: ratingsList,

              onChanged: (value) {},
            ),

            height(0.01),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.45,
                  child: MyButton(
                    thickness: 1.5,
                    borderColor: Colors.red,

                    buttonColor: Colors.transparent,
                    label: 'Cancel',
                    onTap: Get.back,
                  ),
                ),
                width(0.01),
                SizedBox(
                  width: Get.width * 0.45,
                  child: MyButton(
                    label: 'Apply',
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
