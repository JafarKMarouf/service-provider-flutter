import 'package:flutter/material.dart';

BoxShadow customeShadow({
  Color color = Colors.white,
  double spread = 0,
  double blur = 0,
  Offset offset = const Offset(0, 0),
  BlurStyle style = BlurStyle.normal,
}) =>
    BoxShadow(
      blurStyle: style,
      color: color,
      spreadRadius: spread,
      blurRadius: blur,
      offset: offset,
    );
