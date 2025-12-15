import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/Global/colors.dart';

class MyDropDown extends StatelessWidget {
  const MyDropDown({
    super.key,
    this.onTap,
    this.onChanged,
    this.width,
    this.validation,
    required this.dropdownvalue,
    required this.hintText,
    required this.items,
  });

  final String? dropdownvalue;
  final double? width;
  final VoidCallback? onTap;
  final Function(dynamic)? onChanged;
  final String? Function(String?)? validation;
  final String hintText;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: SizedBox(
        width: width ?? Get.width,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: whiteColor.withValues(alpha: 0.2),
            border: Border.all(color: whiteColor.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(25),
          ),
          child: DropdownButtonFormField(
            hint: Text(
              hintText,
              style: TextStyle(color: blackColor, fontSize: 14),
            ),
            style: TextStyle(color: blackColor, fontSize: 14),
            dropdownColor: blackColor,

            onTap: onTap,
            validator: validation,
            onChanged: onChanged,
            // ignore: deprecated_member_use
            value: dropdownvalue,
            icon: Icon(Icons.keyboard_arrow_down_outlined, color: whiteColor),
            menuMaxHeight: Get.height * 0.3,

            items: items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: TextStyle(color: whiteColor)),
                  ),
                )
                .toList(), // Convert List<String> to List<DropdownMenuItem<String>>
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 17,
              ),
              counterText: '',
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              // hintStyle: TextStyle(
              //     fontSize: 14,
              //     color: whiteColor.withOpacity(0.8),
              //     fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
