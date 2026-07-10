import 'package:flutter/material.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_appbar.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Terms & Conditions'),
      body: Padding(
        padding: myPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/terms.png',
                height: 60,
                width: 60,
                color: whiteColor,
              ),
            ),

            height(0.02),

            Text(
              """By using the Hamdard University Library App, you agree to use it only for academic and lawful purposes as an authorized student or staff member. You are responsible for providing correct information and keeping your account secure. Book requests and access to materials are subject to library rules, and digital content must not be copied or shared without permission. You must not misuse the app, attempt to hack it, or use it for commercial purposes. The university may limit or remove access if rules are violated and is not responsible for temporary technical issues. Continued use of the app means you accept any updates to these terms.""",
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
