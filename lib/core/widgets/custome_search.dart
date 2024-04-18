import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class CustomeSearch extends StatelessWidget {
  const CustomeSearch({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: TextField(
        cursorColor: kPrimaryColor,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: Colors.grey[800],
        ),
        decoration: InputDecoration(
          suffixIcon: Image.asset(
            'assets/png/img_search_gray_300.png',
            color: Colors.grey,
          ),
          prefixIcon: Image.asset(
            'assets/png/img_curved_filters.png',
          ),
          hintTextDirection: TextDirection.rtl,
          hintText: 'ابحث عن خدمة',
          contentPadding: const EdgeInsets.only(top: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
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
