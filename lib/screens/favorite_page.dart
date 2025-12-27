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
    final size = MediaQuery.of(context).size;
    final favoriteItems = foodMenu.where((item) => item.isFavorite).toList();
    return favoriteItems.isEmpty
        ? Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/empty_state.png',
                  height: size.height * .3,
                ),

                Text(
                  "No favorite items found!",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.all(size.width * .012),
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
                          height: size.height * .08,
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(width: size.height * .02),
                              Text(
                                favoriteItems[index].name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                "\$ ${favoriteItems[index].price}",
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: size.height * .02),
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
                          iconSize: size.height * .040,
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
