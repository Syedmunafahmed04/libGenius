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
            height(0.02),

            Center(
              child: Image.asset('assets/terms.png', height: 60, width: 60),
            ),

            height(0.02),

            Text(
              '''Worem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: blackColor,
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
