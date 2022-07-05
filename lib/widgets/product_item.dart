import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/schemas/product_schema.dart';
import 'package:flutter_ecommerce/ui/product_page.dart';
import 'package:flutter_ecommerce/widgets/category_subtitle.dart';
import 'package:flutter_ecommerce/widgets/favorites_button.dart';
import 'package:flutter_ecommerce/widgets/product_price.dart';
import 'package:flutter_ecommerce/widgets/rating_subtitle.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product, required this.id})
      : super(key: key);
  final Product product;
  final int id;

  @override
  Widget build(BuildContext context) => ListTile(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProductPage(id: id))),
      leading: Image.asset(product.imgString),
      title: Text(product.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      isThreeLine: true,
      trailing: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Expanded(child: FavoritesButton(id: id, product: product)),
        ProductPrice(product: product)
      ]),
      subtitle: Column(children: [
        CategorySubtitle(product: product),
        RatingSubtitle(product: product)
      ]));
}
