import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/schemas/product_category_schema.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

const Color appBarColor = Color(0xff7dbea2);
const Color appBackgroundColor = Color(0xfff7f7f6);
const Color categoryDotColor = Color(0xff98cab5);
const Color appTextColor = Color(0xff6b6c8a);
const Color exploreProductsButtonColor = Color(0xffb0d5c6);
const Color exploreCardSelectedColor = Color(0xffe8f0ec);
const Color cardTextColor = Color(0xff7dbea2);
const double deliveryCharge = 5.50;

const List<ProductCategory> productCategoryList = [
  ProductCategory(
      categoryName: 'Vitamin',
      icon: FontAwesomeIcons.kitMedical,
      isSelected: true,
      iconColor: Colors.green,
      items: 198),
  ProductCategory(
      categoryName: 'Antibiotic',
      icon: FontAwesomeIcons.tablets,
      isSelected: false,
      iconColor: appBarColor,
      items: 68),
  ProductCategory(
      categoryName: 'Device',
      icon: LineIcons.thermometer,
      isSelected: false,
      iconColor: Colors.red,
      items: 12),
];
