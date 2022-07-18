import 'package:flutter/material.dart';
import 'package:my_app/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required Product product}) : super(key: key);
  static String routeName = "/products_detail";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Detail'),
      ),
      body: const Center(child: Text('Products Detail')),
    );
  }
}
