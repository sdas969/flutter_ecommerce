import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
import 'package:flutter_ecommerce/widgets/cart_item.dart';
import 'package:flutter_ecommerce/widgets/checkout_button.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EcommerceStore store = VxState.store as EcommerceStore;
    return Scaffold(
        appBar: AppBar(
            title: const Text('My Cart'),
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.grid_view_rounded))),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          VxBuilder(
              mutations: const {IncrementProductCount, DecrementProductCount},
              builder: (context, _, __) => Expanded(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    ...store.products
                        .where((product) => product.quantity > 0)
                        .map((product) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CartItem(product: product)))
                  ])))),
          const CheckoutButton()
        ]));
  }
}
