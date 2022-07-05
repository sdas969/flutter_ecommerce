import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {},
      child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: appBarColor, boxShadow: [
            BoxShadow(
                spreadRadius: 5,
                blurRadius: 20,
                color: Colors.grey,
                offset: Offset(0, -5))
          ]),
          child: const Padding(
              padding: EdgeInsets.all(24),
              child: Text('To Checkout',
                  style: TextStyle(fontSize: 18, color: Colors.white)))));
}
