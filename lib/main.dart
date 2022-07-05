import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
import 'package:flutter_ecommerce/ui/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(VxState(store: EcommerceStore(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: Theme.of(context).copyWith(
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: appTextColor, displayColor: appTextColor),
          appBarTheme: const AppBarTheme(
              backgroundColor: appBarColor,
              elevation: 0,
              centerTitle: true,
              foregroundColor: Colors.white)),
      home: const HomeScreen());
}
