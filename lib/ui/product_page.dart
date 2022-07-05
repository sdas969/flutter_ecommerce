import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
import 'package:flutter_ecommerce/widgets/add_to_cart_button.dart';
import 'package:flutter_ecommerce/widgets/category_subtitle.dart';
import 'package:flutter_ecommerce/widgets/favorites_button.dart';
import 'package:flutter_ecommerce/widgets/increment_decrement_counter.dart';
import 'package:flutter_ecommerce/widgets/product_price.dart';
import 'package:flutter_ecommerce/widgets/vertical_tab_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabBarController;
  @override
  void initState() {
    _tabBarController = TabController(initialIndex: 3, vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EcommerceStore store = VxState.store as EcommerceStore;
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.keyboard_arrow_left_sharp))),
        body: Column(children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CategorySubtitle(product: store.products[widget.id]),
                          Text(store.products[widget.id].name,
                              style: const TextStyle(fontSize: 36))
                        ])),
                SizedBox(
                    height: 500,
                    child: Row(children: [
                      VerticalTabBar(tabBarController: _tabBarController),
                      Flexible(
                          child: TabBarView(
                              controller: _tabBarController,
                              children: [
                            Image.asset(store.products[widget.id].imgString),
                            Image.asset(store.products[widget.id].imgString),
                            Image.asset(store.products[widget.id].imgString),
                            Image.asset(store.products[widget.id].imgString),
                          ]))
                    ]))
              ]))),
          Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    spreadRadius: 5,
                    blurRadius: 20,
                    color: Colors.grey,
                    offset: Offset(0, -5))
              ]),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductPrice(product: store.products[widget.id]),
                              const Text('Delivery not included')
                            ]),
                        Row(children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black)),
                              child: FavoritesButton(
                                  id: widget.id,
                                  product: store.products[widget.id])),
                          const SizedBox(width: 8),
                          VxBuilder(
                              mutations: const {
                                IncrementProductCount,
                                DecrementProductCount
                              },
                              builder: (context, _, __) =>
                                  (store.products[widget.id].quantity > 0)
                                      ? IncrementDecrementCounter(
                                          id: widget.id,
                                          product: store.products[widget.id])
                                      : AddToCartButton(
                                          id: widget.id,
                                          product: store.products[widget.id]))
                        ])
                      ])))
        ]));
  }
}
