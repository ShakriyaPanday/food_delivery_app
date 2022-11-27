import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/screens/resturant_screen.dart';
import 'package:food_delivery_app/widgets/rating_star.dart';
import 'package:food_delivery_app/widgets/recent_order.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildResturant() {
    List<Widget> resturantList = [];
    for (var resturant in restaurants) {
      resturantList.add(GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      ResturantScreen(restaurant: resturant)))),
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[300]!,
                )),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: resturant.imageUrl,
                    child: Image(
                        height: 150.0,
                        width: 150.0,
                        fit: BoxFit.fill,
                        image: AssetImage(resturant.imageUrl)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          resturant.name,
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RatingStar(rating: resturant.rating),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          resturant.address,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${resturant.distance} KM far away ",
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )));
    }
    return Column(
      children: resturantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.account_circle,
          ),
          iconSize: 30.0,
          onPressed: (() {}),
        ),
        title: const Text("Food Delivery"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Cart (${currentUser.cart.length})",
              style: const TextStyle(color: Colors.white, fontSize: 19.0),
            ),
          )
        ],
      ),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      BorderSide(width: 0.8, color: Colors.deepOrange[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
                hintText: "Search Food or Restaurant",
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: (() {}),
                )),
          ),
        ),
        const RecentOrder(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Nearby Resturents ",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            _buildResturant()
          ],
        )
      ]),
    );
  }
}
