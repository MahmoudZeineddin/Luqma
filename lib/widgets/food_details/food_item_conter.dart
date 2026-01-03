import 'package:flutter/material.dart';
import 'package:food_delivery/common.dart';

class FoodItemConter extends StatefulWidget {
  const FoodItemConter({super.key});

  @override
  State<FoodItemConter> createState() => _FoodItemConterState();
}

class _FoodItemConterState extends State<FoodItemConter> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: decrementCounter,
              child: Icon(
                Icons.remove,
                color: counter > 1 ? Colors.black : Colors.grey,
              ),
            ),
            SizedBox(width: 7),
            Text(
              counter.toString(),
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 7),
            InkWell(onTap: incrementCounter, child: Icon(Icons.add)),
          ],
        ),
      ),
    );
    ;
  }
}
