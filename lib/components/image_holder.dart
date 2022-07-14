import 'package:flutter/material.dart';

class Imageholder extends StatelessWidget {
  const Imageholder({Key? key, this.imageUrl}) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageUrl!,width: 600,height: 400,fit: BoxFit.cover,);
  }
}