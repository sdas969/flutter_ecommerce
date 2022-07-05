import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/schemas/product_category_schema.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    Key? key,
    required this.productCategory,
  }) : super(key: key);

  final ProductCategory productCategory;

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: productCategory.isSelected ? appBarColor : null),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(productCategory.icon,
              color: productCategory.isSelected
                  ? Colors.white
                  : productCategory.iconColor)));
}
