import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:aslom_carinderia/widgets/logo.dart';
import 'package:aslom_carinderia/widgets/custom_text.dart';
import 'widgets/custom_text_field.dart';
import 'package:aslom_carinderia/widgets/custom_button.dart';
import 'package:aslom_carinderia/widgets/custom_link_button.dart';
import 'package:aslom_carinderia/widgets/version_handler.dart';

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
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _username;
  String? _password;

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Username: $_username, Password: $_password');
    }
  }

  void _handleCreateAccountRoute() {
    print('Go to Create Account Screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Form(
                key: _formKey,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your username";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _username = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      isObscure: true,
                      labelText: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value;
                      },
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
