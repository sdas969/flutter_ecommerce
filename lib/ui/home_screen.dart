import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
import 'package:flutter_ecommerce/ui/cart_page.dart';
import 'package:flutter_ecommerce/widgets/category_cards.dart';
import 'package:flutter_ecommerce/widgets/product_item.dart';
import 'package:flutter_ecommerce/widgets/trending_row.dart';
import 'package:flutter_ecommerce/widgets/view_change_button_row.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EcommerceStore store = VxState.store as EcommerceStore;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: appBarColor,
            foregroundColor: Colors.white,
            title: const Text('STORE'),
            leading:
                //Menu Button
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.grid_view_rounded)),
            actions: [
              //Cart Button
              IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage())),
                  icon: const Icon(Icons.shopping_bag_outlined))
            ]),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Trending Products',
                      style: TextStyle(fontSize: 24))),
              Column(children: [
                TrendingRow(store: store),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Explore Products',
                              style: TextStyle(fontSize: 24)),
                          ViewChangeButtonRow()
                        ])),
                const SizedBox(height: 20),
                const CategoryCards()
              ]),
              const SizedBox(height: 20),
              ...store.products.mapIndexed(
                  (product, index) => ProductItem(product: product, id: index))
            ])));
  }
}
