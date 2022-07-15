import 'dart:convert';

//products.json

List<Product> postFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));


class Product {
  Product({required this.title, required this.image, required this.price});
  String title;
  String image;
  int price;

  factory Product.fromMap(Map<String, dynamic> json) =>Product(
      title: json['name'] ,
      image: json['image'] ,
      price: json['price'] ,
    );
  }


