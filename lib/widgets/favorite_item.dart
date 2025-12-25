import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoriteItem extends StatelessWidget {
  final FoodItemModel foodItemModel;
  const FavoriteItem({super.key, required this.foodItemModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(foodItemModel.imageUrl, height: 70),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 5.0),
                  Text(
                    foodItemModel.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$ ${foodItemModel.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 6.0),
            Icon(Icons.favorite),
          ],
        ),
      ),
    );
  }
}
