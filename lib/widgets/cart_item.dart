import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/schemas/product_schema.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
import 'package:flutter_ecommerce/ui/product_page.dart';
import 'package:flutter_ecommerce/widgets/category_subtitle.dart';
import 'package:flutter_ecommerce/widgets/product_price.dart';
import 'package:velocity_x/velocity_x.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) => ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Colors.white,
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProductPage(id: product.id))),
      leading: Image.asset(product.imgString),
      title: Text(product.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      isThreeLine: true,
      subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            CategorySubtitle(product: product),
            const SizedBox(height: 16),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProductPrice(product: product),
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    const Text('x',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    VxBuilder(
                        mutations: const {
                          IncrementProductCount,
                          DecrementProductCount
                        },
                        builder: (context, _, __) => Text(
                            product.quantity.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)))
                  ])
                ])
          ])));
}
