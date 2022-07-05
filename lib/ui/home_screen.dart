import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
import 'package:flutter_ecommerce/widgets/category_item.dart';
import 'package:flutter_ecommerce/widgets/product_item.dart';
import 'package:flutter_ecommerce/widgets/trending_product_item.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EcommerceStore store = VxState.store as EcommerceStore;
    return Scaffold(
        appBar: AppBar(
            title: const Text('STORE'),
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.grid_view_rounded)),
            actions: [
              IconButton(
                  onPressed: () {},
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
                SizedBox(
                    height: 100,
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        itemCount: store.products.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => VxBuilder(
                            mutations: const {ChangeSeenStatus},
                            builder: (context, _, __) => TrendingProductItem(
                                product: store.products[index])))),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Explore Products',
                              style: TextStyle(fontSize: 24)),
                          Row(children: [
                            TextButton(
                                onPressed: () {},
                                child: Icon(Icons.grid_view,
                                    color: appTextColor.withOpacity(0.25))),
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: exploreProductsButtonColor
                                        .withOpacity(0.25)),
                                child: const Icon(Icons.menu,
                                    color: exploreProductsButtonColor))
                          ])
                        ])),
                const SizedBox(height: 20),
                SizedBox(
                    height: 65,
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        itemCount: productCategoryList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CategoryItem(
                            productCategory: productCategoryList[index])))
              ]),
              const SizedBox(height: 20),
              ...store.products.mapIndexed(
                  (product, index) => ProductItem(product: product, id: index))
            ])));
  }
}
