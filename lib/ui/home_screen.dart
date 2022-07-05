import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/store/ecommerce_store.dart';
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
                child:
                    Text('Trending Products', style: TextStyle(fontSize: 24)),
              ),
              Column(
                children: [
                  SizedBox(
                      height: 100,
                      child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 16),
                          itemCount: store.products.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CircleAvatar(
                              radius: 50,
                              // backgroundImage: AssetImage(store.products[index].imgString),
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  value:
                                      store.products[index].isSeen ? 0 : 1)))),
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
                                child: Icon(
                                  Icons.grid_view,
                                  color: appTextColor.withOpacity(0.25),
                                )),
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: exploreProductsButtonColor
                                        .withOpacity(0.25)),
                                child: const Icon(
                                  Icons.menu,
                                  color: exploreProductsButtonColor,
                                )),
                          ])
                        ]),
                  ),
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
                          itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                  color: productCategoryList[index].isSelected
                                      ? exploreCardSelectedColor
                                      : null,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color:
                                          productCategoryList[index].isSelected
                                              ? Colors.white
                                              : Colors.grey)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color:
                                                    productCategoryList[index]
                                                            .isSelected
                                                        ? appBarColor
                                                        : null),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                    productCategoryList[index]
                                                        .icon,
                                                    color: productCategoryList[
                                                                index]
                                                            .isSelected
                                                        ? Colors.white
                                                        : productCategoryList[
                                                                index]
                                                            .iconColor))),
                                        const SizedBox(width: 16),
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  productCategoryList[index]
                                                      .categoryName,
                                                  style: TextStyle(
                                                      color:
                                                          productCategoryList[
                                                                      index]
                                                                  .isSelected
                                                              ? cardTextColor
                                                              : appTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                              Text(
                                                  productCategoryList[index]
                                                      .items
                                                      .toString(),
                                                  style: TextStyle(
                                                      color:
                                                          productCategoryList[
                                                                      index]
                                                                  .isSelected
                                                              ? cardTextColor
                                                              : appTextColor))
                                            ])
                                      ]))))),
                ],
              ),
              const SizedBox(height: 20),
              ...store.products.mapIndexed((currentValue, index) => ListTile(
                  leading: Image.asset(currentValue.imgString),
                  title: Text(currentValue.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  isThreeLine: true,
                  trailing: Column(children: [
                    Expanded(
                        child: VxBuilder(
                            mutations: const {ChangeFavoriteStatus},
                            builder: (context, _, __) => IconButton(
                                onPressed: () =>
                                    ChangeFavoriteStatus(id: index),
                                icon: Icon(
                                    currentValue.isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: currentValue.isFavourite
                                        ? Colors.red
                                        : null)))),
                    Text('£ ${currentValue.price}')
                  ]),
                  subtitle: Column(children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(children: [
                          const CircleAvatar(
                              radius: 5, backgroundColor: categoryDotColor),
                          const SizedBox(width: 8),
                          Text(currentValue.category)
                        ])),
                    Row(children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text(currentValue.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ])
                  ])))
            ])));
  }
}
