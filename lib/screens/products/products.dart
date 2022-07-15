import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/screens/products/products_detail.dart';

import '../../components/product_card.dart';
import '../../models/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> getProducts() async {
  const String url = 'https://fakestoreapi.com/products';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    print(parsed.map<Product>((parsed) => Product.fromMap(parsed)).toList());
    return parsed.map<Product>((parsed) => Product.fromMap(parsed)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<Product>> fproducts;
  @override
  void initState() {
    super.initState();
    fproducts = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: fproducts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff97FFFF),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].title}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Text("${snapshot.data[index].price}"),
                    ],
                  )));
        } else if (snapshot.hasError) {
          print(snapshot);
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
