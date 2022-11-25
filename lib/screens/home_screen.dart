import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/widgets/recent_order.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: ListView(children: [
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
        RecentOrder(),
      ]),
    );
  }
}
