import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String labelText;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? letterSpacing;
  final Color? color;
  final TextDecoration? decoration;

  const CustomText({
    super.key,
    required this.labelText,
    this.fontWeight = FontWeight.w300,
    this.fontSize = 16,
    this.letterSpacing,
    this.color = Colors.black,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: fontWeight,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          color: color,
          decoration: decoration),
    );
  }
}
