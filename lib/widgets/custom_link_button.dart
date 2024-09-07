import 'package:flutter/material.dart';

import 'package:aslom_carinderia/widgets/custom_text.dart';

class CustomLinkButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomLinkButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.transparent)),
      child: CustomText(
        labelText: buttonText,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
