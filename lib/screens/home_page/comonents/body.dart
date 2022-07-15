import 'package:flutter/material.dart';
import 'package:my_app/screens/products/products.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(child: Column(
     children: const <Widget>[
      SizedBox(height: 20),
      ProductList()
     ],
    )));
  }
}