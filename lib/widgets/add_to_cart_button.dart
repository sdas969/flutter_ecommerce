import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/schemas/product_schema.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.id,
    required this.product,
  }) : super(key: key);
  final int id;
  final Product product;

  @override
  Widget build(BuildContext context) => VxBuilder(
      mutations: const {IncrementProductCount},
      builder: (context, _, __) => Container(
            decoration: BoxDecoration(
                color: appBarColor, borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () => IncrementProductCount(id: id),
                color: Colors.white,
                icon: const Icon(Icons.shopping_bag_outlined)),
          ));
}
