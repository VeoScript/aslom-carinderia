import 'package:flutter/material.dart';

import 'package:aslom_carinderia/widgets/custom_text.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          labelText: 'Aslom',
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
          fontSize: 30,
        ),
        SizedBox(width: 10),
        CustomText(
          labelText: 'Carinderia',
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
          fontSize: 30,
          color: Colors.purple,
        ),
      ],
    );
  }
}
