import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoriteItem extends StatefulWidget {
  final int foodIndex;
  const FavoriteItem({super.key, required this.foodIndex});

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    final favoriteItems = foodMenu.where((item) => item.isFavorite).toList();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              favoriteItems[widget.foodIndex].imageUrl,
              height: 70,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.grey,
                );
              },
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 5.0),
                  Text(
                    favoriteItems[widget.foodIndex].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$ ${favoriteItems[widget.foodIndex].price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 6.0),
            IconButton(
              onPressed: () {
                final targetedItem = favoriteItems[widget.foodIndex];
                int targetedIndex = foodMenu.indexOf(targetedItem);
                setState(() {
                  foodMenu[targetedIndex] = foodMenu[targetedIndex].copyWith(
                    isFavorite: false,
                  );
                  favoriteItems.remove(targetedItem);
                });
              },
              icon: Icon(Icons.favorite),
              color: Colors.red,
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}
