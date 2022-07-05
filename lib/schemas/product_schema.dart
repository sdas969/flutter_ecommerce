class Product {
  Product(
      {required this.id,
      required this.name,
      required this.imgString,
      required this.price,
      required this.category,
      this.isFavourite = false,
      this.isSeen = false,
      this.rating = 0.0,
      this.quantity = 0});
  final int id;
  final double price;
  final double rating;

  int quantity;
  bool isFavourite;
  bool isSeen;

  final String imgString;
  final String name;
  final String category;
}
