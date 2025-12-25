import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteItems = foodMenu.where((item) => item.isFavorite).toList();
    return favoriteItems.isEmpty
        ? Center(
            child: Column(
              children: [
                Image.asset('assets/images/empty_state.png'),
                Text(
                  "No favorite items found!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.network(
                          favoriteItems[index].imageUrl,
                          height: 70,
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: 5.0),
                              Text(
                                favoriteItems[index].name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$ ${favoriteItems[index].price}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 6.0),
                        IconButton(
                          onPressed: () {
                            final targetedItem = favoriteItems[index];
                            int targetedIndex = foodMenu.indexOf(targetedItem);
                            setState(() {
                              foodMenu[targetedIndex] = foodMenu[targetedIndex]
                                  .copyWith(isFavorite: false);
                              favoriteItems.remove(targetedItem);
                            });
                          },
                          icon: Icon(Icons.favorite),
                          color: Theme.of(context).primaryColor,
                          iconSize: 30,
                        ),
                      ],
                    ),
                  ),
                );
                ;
              },
            ),
          );
  }
}
