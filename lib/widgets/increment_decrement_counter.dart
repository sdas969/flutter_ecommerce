import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/schemas/product_schema.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
import 'package:velocity_x/velocity_x.dart';

class IncrementDecrementCounter extends StatelessWidget {
  const IncrementDecrementCounter(
      {Key? key, required this.id, required this.product})
      : super(key: key);
  final int id;
  final Product product;

  @override
  Widget build(BuildContext context) => VxBuilder(
      mutations: const {IncrementProductCount, DecrementProductCount},
      builder: (context, _, __) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)),
          child: Row(children: [
            IconButton(
                color: Colors.white,
                onPressed: () => DecrementProductCount(id: id),
                icon: Container(
                    decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(Icons.remove))),
            Text(product.quantity.toString()),
            IconButton(
                color: Colors.white,
                onPressed: () => IncrementProductCount(id: id),
                icon: Container(
                    decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(Icons.add)))
          ])));
}
