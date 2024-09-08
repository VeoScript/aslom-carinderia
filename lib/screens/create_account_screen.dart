import 'package:flutter/material.dart';

import 'package:aslom_carinderia/widgets/custom_text.dart';
import 'package:aslom_carinderia/widgets/custom_text_field.dart';
import 'package:aslom_carinderia/widgets/custom_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _createAccountFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*?[!@#\$%^&*()_+])[A-Za-z\d!@#\$%^&*()_+]{6,}$');

    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (!passwordRegex.hasMatch(value)) {
      return "Password must be at least 6 characters long and include at least one special character.";
    }
    return null;
  }

  String? _validateRepassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Re-enter password is required";
    }
    if (value != _passwordController.text) {
      return "Passwords do not match, try again.";
    }
    return null;
  }

  void _handleCreateAccount() {
    if (_createAccountFormKey.currentState!.validate()) {
      _createAccountFormKey.currentState!.save();

      print('Name: ${_nameController.text}');
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');
      print('Repassword: ${_repasswordController.text}');

      _handleGoBack();
    }
  }

  void _handleGoBack() {
    _createAccountFormKey.currentState!.reset();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const CustomText(
            labelText: 'Create Account',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Form(
                          key: _createAccountFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                labelText:
                                    "Let's start to create your account first.",
                                fontSize: 18,
                                letterSpacing: -0.5,
                              ),
                              const SizedBox(height: 24),
                              CustomTextField(
                                labelText: 'Name',
                                validator: _validateName,
                                controller: _nameController,
                              ),
                              const SizedBox(height: 14),
                              CustomTextField(
                                labelText: 'Username',
                                validator: _validateUsername,
                                controller: _usernameController,
                              ),
                              const SizedBox(height: 14),
                              CustomTextField(
                                isObscure: true,
                                labelText: 'Password',
                                validator: _validatePassword,
                                controller: _passwordController,
                              ),
                              const SizedBox(height: 14),
                              CustomTextField(
                                isObscure: true,
                                labelText: 'Re-enter password',
                                validator: _validateRepassword,
                                controller: _repasswordController,
                              ),
                              const SizedBox(height: 14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomButton(
                                    buttonText: 'Go back',
                                    onPressed: _handleGoBack,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.purple,
                                    borderColor: Colors.purple,
                                  ),
                                  const SizedBox(width: 14),
                                  CustomButton(
                                    width: 140,
                                    buttonText: 'Register',
                                    onPressed: _handleCreateAccount,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  )),
            )
          ],
        ));
  }
}
