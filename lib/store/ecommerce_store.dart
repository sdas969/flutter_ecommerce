import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/schemas/product_schema.dart';
import 'package:velocity_x/velocity_x.dart';

class EcommerceStore extends VxStore {
  List<Product> products = [
    Product(
        id: 0,
        name: 'D3 + K2 Vitamins',
        imgString: 'images/0.jpg',
        price: 59.50,
        category: 'Powder and Capsules'),
    Product(
        id: 1,
        name: 'Omega3 Vitamins',
        imgString: 'images/1.jpg',
        price: 35.75,
        category: 'Powder and Capsules'),
    Product(
        id: 2,
        name: 'Ginseng Vitamins',
        imgString: 'images/2.jpg',
        price: 22.50,
        category: 'Capsules'),
    Product(
        id: 3,
        name: 'Ginseng Vitamins',
        imgString: 'images/3.jpg',
        price: 22.50,
        category: 'Capsules'),
    Product(
        id: 4,
        name: 'Ginseng Vitamins',
        imgString: 'images/4.jpg',
        price: 22.50,
        category: 'Capsules'),
    Product(
        id: 5,
        name: 'Ginseng Vitamins',
        imgString: 'images/5.jpg',
        price: 22.50,
        category: 'Capsules'),
    Product(
        id: 6,
        name: 'Ginseng Vitamins',
        imgString: 'images/6.jpg',
        price: 22.50,
        category: 'Capsules'),
    Product(
        id: 7,
        name: 'Ginseng Vitamins',
        imgString: 'images/7.jpg',
        price: 22.50,
        category: 'Capsules'),
  ];
}

class CalculateCartValue extends VxMutation<EcommerceStore> {
  @override
  perform() {
    double totalVal = 0;
    final products = store!.products;
    for (int i = 0; i < products.length; i++) {
      if (products[i].quantity > 0) {
        totalVal += products[i].price * products[i].quantity;
      }
    }
    return totalVal + deliveryCharge;
  }
}

class IncrementProductCount extends VxMutation<EcommerceStore> {
  IncrementProductCount({required this.id});
  final int id;
  @override
  perform() => store!.products[id].quantity += 1;
}

class DecrementProductCount extends VxMutation<EcommerceStore> {
  DecrementProductCount({required this.id});
  final int id;
  @override
  perform() => store!.products[id].quantity -= 1;
}

class DeleteFromCart extends VxMutation<EcommerceStore> {
  DeleteFromCart({required this.id});
  final int id;
  @override
  perform() => store!.products[id].quantity = 0;
}

class ChangeFavoriteStatus extends VxMutation<EcommerceStore> {
  ChangeFavoriteStatus({required this.id});
  final int id;
  @override
  perform() =>
      store!.products[id].isFavourite = !store!.products[id].isFavourite;
}
