import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_app/constants/global_variables.dart';

class StarDisplay extends StatelessWidget {
  const StarDisplay({Key? key, required this.rating, required this.count})
      : super(key: key);
  final double rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    print('rating: $rating, count: $count');
    return Row(
      children: [
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
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
          '($count)',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
