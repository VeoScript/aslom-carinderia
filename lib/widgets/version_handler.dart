import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class VersionHandler extends StatelessWidget {
  const VersionHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Version: ${dotenv.env['VERSION_CODE']}',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
    );
  }
}
