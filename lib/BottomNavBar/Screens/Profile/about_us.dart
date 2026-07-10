import 'package:flutter/material.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_appbar.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'About Us'),
      body: Padding(
        padding: myPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/about.png',
                height: 60,
                width: 60,
                color: whiteColor,
              ),
            ),

            height(0.02),

            Text(
              """Hamdard University is a well-established educational institution founded by the visionary scholar and philanthropist Shaheed Hakim Mohammed Said. Built on the principles of knowledge, ethics, and service to humanity, the university aims to provide quality education and develop individuals who contribute positively to society. It offers a wide range of programs in fields such as science, technology, business, and healthcare.

The university focuses on creating a supportive and disciplined learning environment where students can grow both academically and personally. With experienced faculty, modern facilities, and a strong emphasis on research and innovation, Hamdard University prepares students to face real-world challenges with confidence and professionalism.

Hamdard University continues the legacy of Hakim Mohammed Said by promoting education, character building, and lifelong learning. Its mission is to combine academic excellence with moral values, while its vision is to become a leading institution recognized for its contribution to education, research, and community development.""",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
