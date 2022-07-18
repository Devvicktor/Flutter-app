import 'package:flutter/material.dart';
import 'package:my_app/components/default_button.dart';

import '../models/product_model.dart';

class ProductCard extends StatefulWidget {
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) => setState(() {
        _controller.forward();
      }),
      onExit: (value) => setState(() {
        _controller.reverse();
      }),
      child: Container(
        height: _animation.value,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: NetworkImage('product!.image'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            child: AnimatedOpacity(
              opacity: _animation.value == 260.0 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Flexible(
                      child: Text(
                        'product!.name',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Flexible(
                                  child: Text('\$50'),
                                ),
                                Flexible(
                                  child: Row(
                                    children: [
                                      starIcon(Colors.yellow[700]!),
                                      starIcon(Colors.yellow[700]!),
                                      starIcon(Colors.yellow[700]!),
                                      starIcon(Colors.yellow[700]!),
                                      starIcon(Colors.grey[200]!),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Material(
                                  color: Colors.grey[200],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Center(
                                      child: Icon(
                                        Icons.bookmark,
                                        size: 15.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        width: 130.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue[200]!,
                              offset: const Offset(0.0, 10.0),
                              spreadRadius: -5.0,
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: const Center(
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                    fontSize: 8.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Icon starIcon(Color color) {
    return Icon(
      Icons.star,
      size: 10.0,
      color: color,
    );
  }
}
