import 'package:flutter/material.dart';


import '../../../components/default_button.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return  SafeArea(child:
    SizedBox(
 width: double.infinity,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child:SingleChildScrollView(
   child: Column(
    children:  [
     const Text(
        'Sign In',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
     const SizedBox(height: 20),
      const TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
        ),
      ),
     const SizedBox(height: 20),
      const TextField(
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
        ),
      ),
     const  SizedBox(height: 20),

    //buttons
    DefaultButton(
      text: 'Sign In',
      press: () async {
        Navigator.pushNamed(context, '/post');
      },

    ),

    ],

   ),
    )

  )
    ),
    );

}
}