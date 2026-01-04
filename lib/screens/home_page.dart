import 'package:flutter/material.dart';
import 'package:food_delivery/common.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/screens/food_details_page.dart';
import 'package:food_delivery/widgets/food_gride_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final textScaler = MediaQuery.of(context).textScaler;
    // علشان  الخط يكبر بحسب الخط تاع النظام
    //، مش واضح ميف بيستخدم ولكن عادي لمن أحتاجه ببحثث عنه
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: context.widthPct(0.80),
                child: ClipRRect(
                  // BorderRadiusعلشان أعدل
                  borderRadius: BorderRadius.circular(24.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    //هذا يعني: "يا فلاتر، مهما كان العرض المتاح لكِ، اجعلي الارتفاع دائماً يساوي 9/16 من ذلك العرض".
                    child: Image.asset(
                      'assets/images/classic_burger.jpg',
                      // height: context.heightPct(.215),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.heightPct(.02)),
              GridView.builder(
                shrinkWrap:
                    true, //  علشان يآخذ بس المساحة اللي بيحتاجها ما يآخذ كل المساحة المتبقية
                itemCount: foodMenu.length,
                physics:
                    const NeverScrollableScrollPhysics(), // جعل التمرير بس من خلال السكروال الرئيسي للوديجت
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.isLandscape ? 3 : 2,
                  mainAxisSpacing: context.heightPct(.02),
                  crossAxisSpacing: context.heightPct(.02),
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) => FoodDetailsPage(index: index),
                          ),
                        )
                        .then((onValue) => setState(() {}));
                  },
                  child: FoodGrigeItem(foodIndex: index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
