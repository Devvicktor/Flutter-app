import 'package:flutter/widgets.dart';
import 'package:my_app/screens/home_page/home_page.dart';
import 'package:my_app/screens/post/index.dart';

import 'package:my_app/screens/sign_in/login.dart';
import 'package:my_app/screens/sign_up/register.dart';


const title='Welcome to my appp';

final Map<String, WidgetBuilder> routes = {
  MyHomePage.routeName:(context) => const MyHomePage(title: title,),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  SignInScreen.routeName: (context) =>const  SignInScreen(),
  '/post': (context) =>const PostScreen(),
};