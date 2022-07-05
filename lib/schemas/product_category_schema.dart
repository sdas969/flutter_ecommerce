import 'package:flutter/material.dart';

class ProductCategory {
  const ProductCategory(
      {required this.categoryName,
      required this.icon,
      required this.iconColor,
      required this.isSelected,
      required this.items});
  final int items;
  final String categoryName;
  final IconData icon;
  final bool isSelected;
  final Color iconColor;
}
