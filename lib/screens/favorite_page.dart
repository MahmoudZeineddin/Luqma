import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favorite_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteItems = foodMenu.where((item) => item.isFavorite).toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (BuildContext context, int index) {
          return FavoriteItem(foodItemModel: favoriteItems[index]);
        },
      ),
    );
  }
}
