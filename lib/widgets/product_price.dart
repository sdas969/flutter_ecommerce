import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/schemas/product_schema.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) => Text('£ ${product.price}',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
}
