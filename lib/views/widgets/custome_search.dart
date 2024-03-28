import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/constant.dart';

class CustomeSearch extends StatelessWidget {
  const CustomeSearch({super.key,required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 60,
      child: TextField(
        cursorColor: kPrimaryColor,
        textDirection: TextDirection.rtl,
        style: TextStyle(color: Colors.grey[800]),
        decoration: InputDecoration(
          suffixIcon: SvgPicture.asset(
              'assets/images/img_search_gray_300.svg',

           ),
          prefixIcon:SvgPicture.asset(
              'assets/images/img_curved_filters1.svg',
            width: 24,
            height: 24,
          ),
            // Icon(, color: kPrimaryColor, size: 32),
          hintTextDirection: TextDirection.rtl,
          hintText: 'ابحث عن خدمة',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
