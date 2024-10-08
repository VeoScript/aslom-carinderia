import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool isObscure;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
    this.onSaved,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        errorMaxLines: 10,
        floatingLabelStyle:
            const TextStyle(fontFamily: 'Poppins', color: Colors.purple),
        labelStyle:
            const TextStyle(fontFamily: 'Poppins', color: Colors.black38),
        errorStyle: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.red.shade700,
        ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.black38,
              width: 1,
            )),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.purple,
              width: 1,
            )),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.red.shade700,
            width: 1,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.purple,
            width: 1,
          ),
        ),
      ),
    );
  }
}
