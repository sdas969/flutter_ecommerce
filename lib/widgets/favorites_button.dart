import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/schemas/product_schema.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
import 'package:velocity_x/velocity_x.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton({
    Key? key,
    required this.id,
    required this.product,
  }) : super(key: key);

  final int id;
  final Product product;

  @override
  Widget build(BuildContext context) => VxBuilder(
      mutations: const {ChangeFavoriteStatus},
      builder: (context, _, __) => IconButton(
          onPressed: () => ChangeFavoriteStatus(id: id),
          icon: Align(
              alignment: Alignment.topRight,
              child: Icon(
                  product.isFavourite ? Icons.favorite : Icons.favorite_outline,
                  color: product.isFavourite ? Colors.red : null))));
}
