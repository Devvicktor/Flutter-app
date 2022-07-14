import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String? email;
  String? password;
  bool? isLoading = false;
  bool? rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Form(child:
      Column(
        children: [
          buildPasswordTextField(context),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            onChanged: (value) => email = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            onChanged: (value) => password = value,
          ),
          CheckboxListTile(
            title: const Text('Remember me'),
            value: rememberMe,
            onChanged: (value) => rememberMe = value,
          ),
          TextButton(
            child: const Text('Sign In'),
            onPressed: () async {
              setState(() => isLoading = true);
              await Future.delayed(const Duration(seconds: 1));
              setState(() => isLoading = false);
            },
          ),
          if (isLoading== true)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      validator: (value) => value!.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (newValue) => password = newValue,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
