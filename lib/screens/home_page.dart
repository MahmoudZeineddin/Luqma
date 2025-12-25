import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/food_gride_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              // BorderRadiusعلشان أعدل
              borderRadius: BorderRadius.circular(24.0),
              child: Image.asset(
                'assets/images/classic_burger.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),
            GridView.builder(
              shrinkWrap:
                  true, //  علشان يآخذ بس المساحة اللي بيحتاجها ما يآخذ كل المساحة المتبقية
              itemCount: foodMenu.length,
              physics:
                  const NeverScrollableScrollPhysics(), // جعل التمرير بس من خلال السكروال الرئيسي للوديجت
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) =>
                  FoodGrigeItem(foodItem: foodMenu[index]),
            ),
          ],
        ),
      ),
    );
  }
}
