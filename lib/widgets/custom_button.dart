import 'package:flutter/material.dart';

import 'package:aslom_carinderia/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double? width;
  final Color? textColor;
  final Color? backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsets padding;

  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.width,
      this.textColor = Colors.black,
      this.backgroundColor = Colors.purple,
      this.borderColor = Colors.black12,
      this.borderWidth = 1,
      this.padding = const EdgeInsets.all(18)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          side: BorderSide(
            style: BorderStyle.solid,
            color: borderColor,
            width: borderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
        ),
        child: CustomText(
          labelText: buttonText,
          fontSize: 14,
          color: textColor,
        ),
      ),
    );
  }
}
