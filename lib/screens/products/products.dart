import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_app/components/default_button.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/screens/products/products_detail.dart';
import 'package:my_app/screens/products/star_display.dart';

import '../../components/product_card.dart';
import '../../models/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> getProducts() async {
  const String url = 'https://fakestoreapi.com/products';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    print(parsed.map<Product>((parsed) => Product.fromJson(parsed)).toList());
    return parsed.map<Product>((parsed) => Product.fromJson(parsed)).toList();
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
            itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   width: 150,
                    //   child:

                    Expanded(
                        child: Image.network(
                      snapshot.data![index].image,
                      // fit: BoxFit.cover,
                      scale: 0.5,
                    )),

                    // ),
                    SizedBox(
                      width: 200,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 15, 15, 15),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                snapshot.data![index].title,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Chip(
                                elevation: 5,
                                backgroundColor: Colors.grey[200],
                                label: Text(
                                  snapshot.data![index].category,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating:
                                        snapshot.data![index].rating.rate,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: GlobalVaraibles.secondaryColor,
                                      size: 15.0,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                    itemSize: 15.0,
                                  ),
                                  //rating count
                                  Text(
                                    '(${snapshot.data![index].rating.count})',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                '\$${snapshot.data![index].price}',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 2.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetail(
                                                  product:
                                                      snapshot.data![index],
                                                ),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.share,
                                            color:
                                                GlobalVaraibles.secondaryColor,
                                            size: 18,
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetail(
                                                  product:
                                                      snapshot.data![index],
                                                ),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.favorite,
                                            color:
                                                GlobalVaraibles.secondaryColor,
                                            size: 18,
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetail(
                                                  product:
                                                      snapshot.data![index],
                                                ),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.add_shopping_cart,
                                            color:
                                                GlobalVaraibles.secondaryColor,
                                            size: 15,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
