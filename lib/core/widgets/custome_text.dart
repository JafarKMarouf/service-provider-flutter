import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  const CustomeText({
    super.key,
    required this.text,
    required this.size,
    this.weight,
    this.fontFamily,
    this.color = Colors.black,
  });
  final String text;
  final double size;
  final FontWeight? weight;
  final Color color;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        fontFamily: fontFamily,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textDirection: TextDirection.rtl,
    );
  }
}
