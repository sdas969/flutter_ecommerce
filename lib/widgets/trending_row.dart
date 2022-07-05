import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
import 'package:flutter_ecommerce/widgets/trending_product_item.dart';
import 'package:velocity_x/velocity_x.dart';

class TrendingRow extends StatelessWidget {
  const TrendingRow({
    Key? key,
    required this.store,
  }) : super(key: key);

  final EcommerceStore store;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 100,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemCount: store.products.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => VxBuilder(
              mutations: const {ChangeSeenStatus},
              builder: (context, _, __) =>
                  TrendingProductItem(product: store.products[index]))));
}
