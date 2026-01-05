import 'package:flutter/material.dart';
import 'package:food_delivery/common.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/screens/food_details_page.dart';
import 'package:food_delivery/utilities/app_assets.dart';

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
                Image.asset(
                  AppAssets.emptyState,
                  height: !context.isLandscape
                      ? context.heightPct(.3)
                      : context.heightPct(.4),
                ),

                Text(
                  "No favorite items found!",
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.all(context.widthPct(.012)),
            child: ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    int targetedIndex = foodMenu.indexOf(favoriteItems[index]);
                    Navigator.of(context).pushNamed(
                      FoodDetailsPage.routeName,
                      arguments: targetedIndex,
                    );
                    // Navigator.of(context)

                    //     .push<String>(
                    //       MaterialPageRoute(
                    //         builder: (context) {
                    //           return FoodDetailsPage();
                    //         },
                    //       ),
                    //     )
                    //     .then((value) {
                    //       setState(() {
                    //         debugPrint(',,,,, The value $value');
                    //       });
                    //     });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.network(
                            favoriteItems[index].imageUrl,
                            height: !context.isLandscape
                                ? context.heightPct(.08)
                                : context.heightPct(.15),
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(width: context.heightPct(.02)),
                                Text(
                                  favoriteItems[index].name,
                                  style: context.textTheme.titleMedium,
                                ),
                                Text(
                                  "\$ ${favoriteItems[index].price}",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                        color: context.colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: context.heightPct(.02)),
                          IconButton(
                            onPressed: () {
                              final targetedItem = favoriteItems[index];
                              int targetedIndex = foodMenu.indexOf(
                                targetedItem,
                              );
                              setState(() {
                                foodMenu[targetedIndex] =
                                    foodMenu[targetedIndex].copyWith(
                                      isFavorite: false,
                                    );
                                favoriteItems.remove(targetedItem);
                              });
                            },
                            icon: Icon(Icons.favorite),
                            color: context.colorScheme.primary,
                            iconSize: !context.isLandscape
                                ? context.heightPct(.040)
                                : context.heightPct(.080),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
