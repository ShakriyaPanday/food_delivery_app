import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/order.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({super.key});

  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      width: 320.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
              image: AssetImage(order.food.imageUrl),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.food.name,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    order.restaurant.name,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    order.date,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: (() {}),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Recent Orders",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(
          height: 120.0,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(context, order);
            },
          ),
        )
      ],
    );
  }
}
