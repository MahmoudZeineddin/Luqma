import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodGrigeItem extends StatelessWidget {
  final FoodItemModel foodMenu;
  const FoodGrigeItem({super.key, required this.foodMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          /**/
          Image.network(foodMenu.imageUrl, height: 100, fit: BoxFit.contain),
          const SizedBox(height: 10.0),
          Text(
            foodMenu.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(height: 10.0),
          Text(
            "${foodMenu.price}\$",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
