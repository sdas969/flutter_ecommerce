import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/schemas/product_schema.dart';

class CategorySubtitle extends StatelessWidget {
  const CategorySubtitle({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Row(children: [
        const CircleAvatar(radius: 5, backgroundColor: categoryDotColor),
        const SizedBox(width: 8),
        Text(product.category)
      ]));
}
