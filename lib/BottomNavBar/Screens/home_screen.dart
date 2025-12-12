import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/BottomNavBar/Screens/Home/book_detail.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: myPadding,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/banner.jpg', fit: BoxFit.cover),
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
              MySeeAll(title: 'Latest', onTap: () {}),
              height(0.01),

              SizedBox(
                height: Get.height * 0.23,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return width(.02);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,

                  itemBuilder: (context, index) {
                    return MyHomeCard(
                      onTap: () {
                        Get.to(() => BookDetail());
                      },
                    );
                  },
                ),
              ),

              height(.02),
              MySeeAll(title: 'Most Rated', onTap: () {}),
              height(0.01),

              SizedBox(
                height: Get.height * 0.23,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return width(.02);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,

                  itemBuilder: (context, index) {
                    return MyHomeCard(
                      onTap: () {
                        Get.to(() => BookDetail());
                      },
                    );
                  },
                ),
              ),
              height(0.02),
            ],
          ),
        ),
      ),
    );
  }
}
