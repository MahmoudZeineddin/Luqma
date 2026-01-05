import 'package:flutter/material.dart';
import 'package:food_delivery/common.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodGrigeItem extends StatefulWidget {
  final int foodIndex;
  final List<FoodItemModel> filteredFood;
  const FoodGrigeItem({
    super.key,
    required this.foodIndex,
    required this.filteredFood,
  });

  @override
  State<FoodGrigeItem> createState() => _FoodGrigeItemState();
}

class _FoodGrigeItemState extends State<FoodGrigeItem> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final trgetedIndex = foodMenu.indexOf(
      widget.filteredFood[widget.foodIndex],
    );
    return Container(
      decoration: BoxDecoration(color: Colors.grey[50]),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxHeight = constraints.maxHeight;
          double maxWidth = constraints.maxWidth;
          return Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.network(
                    widget.filteredFood[widget.foodIndex].imageUrl,
                    height: maxHeight * .5,
                    // context.heightPct(.12)
                    fit: BoxFit.contain,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.circular(32.0),
                      // ),
                      height: maxHeight * .15,
                      width: maxWidth * .15,
                      child: InkWell(
                        onTap: () {
                          final foodId =
                              widget.filteredFood[widget.foodIndex].id;

                          final indexInFoodMenu = foodMenu.indexWhere(
                            (item) => item.id == foodId,
                          );

                          if (indexInFoodMenu == -1) return;

                          setState(() {
                            foodMenu[indexInFoodMenu] =
                                foodMenu[indexInFoodMenu].copyWith(
                                  isFavorite:
                                      !foodMenu[indexInFoodMenu].isFavorite,
                                );
                          });
                          // // final targetedIndex = foodMenu.indexOf(
                          // //   widget.filteredFood[widget.foodIndex],
                          // // );
                          // setState(() {
                          //   widget.filteredFood[widget.foodIndex] = widget
                          //       .filteredFood[widget.foodIndex]
                          //       .copyWith(
                          //         isFavorite: !widget
                          //             .filteredFood[widget.foodIndex]
                          //             .isFavorite,
                          //       );
                          // });
                        },
                        child: widget.filteredFood[widget.foodIndex].isFavorite
                            ? Icon(
                                Icons.favorite,
                                color: context.colorScheme.primary,
                                size: constraints.maxWidth * .15,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: context.colorScheme.primary,
                                size: constraints.maxWidth * .15,
                              ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: maxHeight * 0.05),
              Text(
                widget.filteredFood[widget.foodIndex].name,
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: maxWidth * 0.08,
                ),
              ),
              SizedBox(height: maxHeight * 0.05),
              Text(
                "${widget.filteredFood[widget.foodIndex].price}\$",
                style: context.textTheme.titleSmall!.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: maxWidth * 0.08,
                ),
              ),
              SizedBox(height: maxHeight * 0.05),
            ],
          );
        },
      ),
    );
  }
}
