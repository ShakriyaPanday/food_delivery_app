import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';

class ResturantScreen extends StatelessWidget {
  final Restaurant restaurant;

  const ResturantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(restaurant.name),
    );
  }
}
