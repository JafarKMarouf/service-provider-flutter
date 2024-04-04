import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.color = kPrimaryColor, required this.width
  });
  final String title;
  final VoidCallback ? onTap;
  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none
      ),
      elevation: .6,
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color:Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
