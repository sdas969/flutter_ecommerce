import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/schemas/product_schema.dart';

class RatingSubtitle extends StatelessWidget {
  const RatingSubtitle({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) => Row(children: [
        const Icon(Icons.star, color: Colors.yellow),
        Text(product.rating.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold))
      ]);
}
