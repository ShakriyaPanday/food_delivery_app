import 'package:food_delivery_app/models/food.dart';

class Restaurant {
  final String imageUrl;
  final String name;
  final String address;
  final int rating;
  final double distance;
  final List<Food> menu;

  Restaurant(
      {required this.imageUrl,
      required this.name,
      required this.address,
      required this.rating,
      required this.distance,
      required this.menu});
}
