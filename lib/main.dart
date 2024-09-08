import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Custom Widgets Imports
import 'package:aslom_carinderia/widgets/logo.dart';
import 'package:aslom_carinderia/widgets/custom_text.dart';
import 'widgets/custom_text_field.dart';
import 'package:aslom_carinderia/widgets/custom_button.dart';
import 'package:aslom_carinderia/widgets/version_handler.dart';

// Screens Imports
import 'package:aslom_carinderia/screens/create_account_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your username";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  void _handleLogin() {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();

      print(
          'Username: ${_usernameController.text}, Password: ${_passwordController.text}');
    }
  }

  void _handleCreateAccountRoute() {
    _loginFormKey.currentState!.reset();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CreateAccountScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Logo(),
                    const SizedBox(height: 5),
                    const CustomText(
                      labelText: 'Welcome please login',
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      labelText: 'Username',
                      validator: _validateUsername,
                      controller: _usernameController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      isObscure: true,
                      labelText: 'Password',
                      validator: _validatePassword,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                          buttonText: 'Create Account',
                          onPressed: _handleCreateAccountRoute,
                          backgroundColor: Colors.white,
                          textColor: Colors.purple,
                          borderColor: Colors.purple,
                        ),
                        const SizedBox(width: 10),
                        CustomButton(
                          width: 100,
                          buttonText: 'Log in',
                          onPressed: _handleLogin,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Version text at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: const VersionHandler(),
            ),
          ),
        ],
      ),
    );
  }
}
