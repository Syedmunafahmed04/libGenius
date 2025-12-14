
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:shimmer/shimmer.dart';


class ImageWidget extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final BoxFit? fit;
  final Color? color;
  const ImageWidget({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300, //whiteColor,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        "assets/no_image.png",
        height: height,
        width: width,
        color: color,
        fit: BoxFit.cover,
      ),
      errorListener: (value) {
        myPrint(value);
      },
    );
  }
}
