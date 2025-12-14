import 'package:flutter/material.dart';
import 'package:libgenius/Global/colors.dart';

class MySeeAll extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const MySeeAll({super.key, required this.title,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

        // GestureDetector(
        //   onTap: onTap,
        //   child: Text(
        //     'See All',
        //     style: TextStyle(
        //       fontSize: 13,
        //       decoration: TextDecoration.underline,
        //       decorationColor: Colors.grey,
        //       color: Colors.grey,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
