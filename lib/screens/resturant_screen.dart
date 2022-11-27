import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';

class ResturantScreen extends StatelessWidget {
  final Restaurant restaurant;

  const ResturantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: restaurant.imageUrl,
                child: Image(
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  image: AssetImage(restaurant.imageUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (() => Navigator.pop(context)),
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: (() {}),
                      icon: const Icon(Icons.favorite),
                      iconSize: 30.0,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
