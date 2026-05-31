import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/BottomNavBar/Screens/Home/book_detail.dart';
import 'package:libgenius/Controllers/book_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_appbar.dart';
import 'package:libgenius/Widgets/my_home_card.dart';
import 'package:libgenius/Widgets/my_see_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bookController = Get.put(BookController());

  Future<void> myInit() async {
    await bookController.getBooks();
  }

  @override
  void initState() {
    super.initState();
    myInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(isHome: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: myPadding,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/hikma.jpg', fit: BoxFit.cover),
              ),
              height(0.02),
              SizedBox(
                height: Get.height * 0.2,
                width: Get.width,
                child: PageView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/banner.jpg',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              height(.02),
              MySeeAll(title: 'Latest'),
              height(0.01),

              Obx(() {
                final data = bookController.booksModel.value.books;

                if (data == null) {
                  return Center(
                    child: CircularProgressIndicator(color: mainThemeColor),
                  );
                }

                if (data.isEmpty) {
                  return Center(child: Text('No Data Found'));
                }
                return SizedBox(
                  height: Get.height * 0.24,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return width(.02);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,

                    itemBuilder: (context, index) {
                      final book = data[index];
                      return MyHomeCard(
                        bookData: book,
                        onTap: () {
                          Get.to(() => BookDetail(bookData: book));
                        },
                      );
                    },
                  ),
                );
              }),

              height(.02),
              MySeeAll(title: 'Most Rated'),
              height(0.01),

              Obx(() {
                final data = bookController.booksModel.value.books;

                if (data == null) {
                  return Center(
                    child: CircularProgressIndicator(color: mainThemeColor),
                  );
                }

                if (data.isEmpty) {
                  return Center(child: Text('No Data Found'));
                }
                return SizedBox(
                  height: Get.height * 0.24,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return width(.02);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,

                    itemBuilder: (context, index) {
                      final book = data[index];
                      return MyHomeCard(
                        bookData: book,
                        onTap: () {
                          Get.to(() => BookDetail(bookData: book));
                        },
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
