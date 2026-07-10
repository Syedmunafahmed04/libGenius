import 'package:flutter/material.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_appbar.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Privacy Policy'),
      body: Padding(
        padding: myPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/privacy.png',
                height: 60,
                width: 60,
                color: whiteColor,
              ),
            ),

            height(0.02),

            Text(
              '''The Hamdard University Library App collects basic information such as your name, student ID, email, and app usage to provide library services like searching books, making requests, and improving your experience. Your data is only used for academic and app-related purposes and is shared only with authorized university staff when necessary. We do not sell your information, and we take reasonable steps to keep it secure. Your data is kept only as long as needed according to university policies, and you may request to access, update, or delete your information by contacting us. By using this app, you agree to this privacy policy.''',
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
