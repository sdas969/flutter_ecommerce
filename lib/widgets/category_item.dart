import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/schemas/product_category_schema.dart';
import 'package:flutter_ecommerce/widgets/category_details.dart';
import 'package:flutter_ecommerce/widgets/category_icon.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.productCategory})
      : super(key: key);
  final ProductCategory productCategory;

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          color: productCategory.isSelected ? exploreCardSelectedColor : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: productCategory.isSelected ? Colors.white : Colors.grey)),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CategoryIcon(productCategory: productCategory),
            const SizedBox(width: 16),
            CategoryDetails(productCategory: productCategory)
          ])));
}
