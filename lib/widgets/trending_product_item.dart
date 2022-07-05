import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/schemas/product_schema.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';

class TrendingProductItem extends StatelessWidget {
  const TrendingProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => ChangeSeenStatus(id: product.id),
      child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                  image: AssetImage(product.imgString), fit: BoxFit.cover),
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                  color: product.isSeen ? Colors.white : appBarColor,
                  width: 4.0))));
}
