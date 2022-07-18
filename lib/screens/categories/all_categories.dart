import 'package:flutter/material.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({Key? key}) : super(key: key);
  static String routeName = "/categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: const Center(
        child: Text('All Categories'),
      ),
    );
  }
}
