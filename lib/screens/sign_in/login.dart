import 'package:flutter/material.dart';
import 'package:my_app/screens/sign_in/components/sign_in_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: const Center( child: SignInWidget()),
    );
  }
}