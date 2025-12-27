import 'package:flutter/material.dart';
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
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Column(
        children: [
          /**/
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.network(
                foodMenu[widget.foodIndex].imageUrl,
                height: size.height * .12,
                fit: BoxFit.contain,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  height: 30,
                  width: 30,
                  child: InkWell(
                    onTap: () => {
                      setState(() {
                        foodMenu[widget.foodIndex] = foodMenu[widget.foodIndex]
                            .copyWith(
                              isFavorite:
                                  !foodMenu[widget.foodIndex].isFavorite,
                            );
                      }),
                    },
                    child: foodMenu[widget.foodIndex].isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Theme.of(context).primaryColor,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Theme.of(context).primaryColor,
                          ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10.0),
          Text(
            foodMenu[widget.foodIndex].name,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            "${foodMenu[widget.foodIndex].price}\$",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
