import 'package:flutter/material.dart';

import 'package:aslom_carinderia/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.width = double.infinity,
    this.color = Colors.purple,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed, // Call login function
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: color),
        child: CustomText(
          labelText: buttonText,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
