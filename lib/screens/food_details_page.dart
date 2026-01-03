import 'package:flutter/material.dart';
import 'package:food_delivery/core/extensions/context_extensions.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/food_details/food_item_conter.dart';
import 'package:food_delivery/widgets/food_details/top_banner.dart';

class FoodDetailsPage extends StatefulWidget {
  final FoodItemModel foodItemModel;
  const FoodDetailsPage({super.key, required this.foodItemModel});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

Widget itemDetails(
  BuildContext context, {
  required String titleName,
  required String subTitle,
}) {
  return Column(
    children: [
      Text(
        titleName,
        style: context.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 3),
      Text(
        subTitle,
        style: context.textTheme.bodyLarge!.copyWith(
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // void toggleFavorite() {
  //   final index = foodMenu.indexOf(widget.foodItemModel);

  //   setState(() {
  //     foodMenu[index] = foodMenu[index].copyWith(
  //       isFavorite: !foodMenu[index].isFavorite,
  //     );

  //     // foodItemModel = foodMenu[index];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBanner(
                foodItemModel: widget.foodItemModel,
                // onFavoriteToggle: toggleFavorite,
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.foodItemModel.name,
                              style: context.textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              widget.foodItemModel.subtitle,
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        FoodItemConter(),
                      ],
                    ),

                    SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: itemDetails(
                            context,
                            titleName: 'Size',
                            subTitle: 'Medium',
                          ),
                        ),
                        Expanded(
                          child: itemDetails(
                            context,
                            titleName: 'Cooking',
                            subTitle: '10-15 min',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Text(
                      widget.foodItemModel.description.toString(),
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.foodItemModel.price}\$",
                            style: context.textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            width: context.widthPct(.6),
                            height: context.heightPct(.05),
                            child: Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: context.colorScheme.primary,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Add to cart',
                                  style: context.textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
