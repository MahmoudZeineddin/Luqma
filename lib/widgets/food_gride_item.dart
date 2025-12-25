import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodGrigeItem extends StatefulWidget {
  final FoodItemModel foodItem;
  const FoodGrigeItem({super.key, required this.foodItem});

  @override
  State<FoodGrigeItem> createState() => _FoodGrigeItemState();
}

class _FoodGrigeItemState extends State<FoodGrigeItem> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Column(
        children: [
          /**/
          Stack(
            children: [
              Image.network(
                widget.foodItem.imageUrl,
                height: 100,
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
                        widget.foodItem.copyWith(isFavorite: true);
                        isFav = !isFav;
                      }),
                    },
                    child: isFav
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10.0),
          Text(
            widget.foodItem.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(height: 10.0),
          Text(
            "${widget.foodItem.price}\$",
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
