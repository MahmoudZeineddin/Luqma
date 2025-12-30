import 'package:flutter/material.dart';
import 'package:food_delivery/common.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodGrigeItem extends StatefulWidget {
  final int foodIndex;
  const FoodGrigeItem({super.key, required this.foodIndex});

  @override
  State<FoodGrigeItem> createState() => _FoodGrigeItemState();
}

class _FoodGrigeItemState extends State<FoodGrigeItem> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
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
                    foodMenu[widget.foodIndex].imageUrl,
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
                        onTap: () => {
                          setState(() {
                            foodMenu[widget.foodIndex] =
                                foodMenu[widget.foodIndex].copyWith(
                                  isFavorite:
                                      !foodMenu[widget.foodIndex].isFavorite,
                                );
                          }),
                        },
                        child: foodMenu[widget.foodIndex].isFavorite
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
                foodMenu[widget.foodIndex].name,
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: maxWidth * 0.08,
                ),
              ),
              SizedBox(height: maxHeight * 0.05),
              Text(
                "${foodMenu[widget.foodIndex].price}\$",
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
