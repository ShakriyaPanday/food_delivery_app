import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/widgets/rating_star.dart';

class ResturantScreen extends StatelessWidget {
  final Restaurant restaurant;

  const ResturantScreen({super.key, required this.restaurant});
  _buildMenuItems(Food menuItems) {
    return Center(
      child: Stack(alignment: Alignment.center, children: [
        Container(
          width: 175.0,
          height: 175.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(menuItems.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Container(
          width: 175.0,
          height: 175.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: const [
                  0.1,
                  0.4,
                  0.6,
                  0.9
                ]),
          ),
        ),
        Positioned(
          bottom: 65.0,
          child: Column(
            children: [
              Text(
                menuItems.name,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                '\$ ${menuItems.price}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onPressed: (() {}),
                )))
      ]),
    );
  }

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
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${restaurant.distance} KM Away",
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                RatingStar(rating: restaurant.rating),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  restaurant.address,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Reviews",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Contact",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Center(
            child: Text(
              "Menu",
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(restaurant.menu.length, (index) {
                Food food = restaurant.menu[index];
                return _buildMenuItems(food);
              }),
            ),
          )
        ],
      ),
    );
  }
}
