import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/schemas/product_category_schema.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({
    Key? key,
    required this.productCategory,
  }) : super(key: key);

  final ProductCategory productCategory;

  @override
  Widget build(BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productCategory.categoryName,
                style: TextStyle(
                    color: productCategory.isSelected
                        ? cardTextColor
                        : appTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Text(productCategory.items.toString(),
                style: TextStyle(
                    color: productCategory.isSelected
                        ? cardTextColor
                        : appTextColor))
          ]);
}
