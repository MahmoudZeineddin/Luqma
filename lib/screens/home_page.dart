import 'package:flutter/material.dart';
import 'package:food_delivery/common.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/screens/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_arg.dart';
import 'package:food_delivery/utilities/app_assets.dart';
import 'package:food_delivery/widgets/food_gride_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? categorySelectedId;
  late List<FoodItemModel> filteredFood;

  @override
  void initState() {
    super.initState();
    filteredFood = foodMenu;
  }

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
                      AppAssets.classicBurger,
                      // height: context.heightPct(.215),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.heightPct(.02)),
              SizedBox(
                height: context.heightPct(.14),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsetsDirectional.only(end: 16),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          categorySelectedId = categories[index].id;
                        });
                        filteredFood = foodMenu
                            .where(
                              (item) => item.categoryId == categorySelectedId,
                            )
                            .toList();
                      },
                      child: Container(
                        width: context.widthPct(0.25),
                        decoration: BoxDecoration(
                          color: categorySelectedId == categories[index].id
                              ? context.colorScheme.primary
                              : Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                categories[index].imgPath,
                                height: context.heightPct(.06),
                              ),
                              SizedBox(height: context.heightPct(.005)),
                              Text(
                                categories[index].title,
                                style: context.textTheme.titleMedium!.copyWith(
                                  color:
                                      categorySelectedId == categories[index].id
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount: categories.length,
                ),
              ),

              SizedBox(height: context.heightPct(.03)),
              GridView.builder(
                shrinkWrap:
                    true, //  علشان يآخذ بس المساحة اللي بيحتاجها ما يآخذ كل المساحة المتبقية
                itemCount: filteredFood.length,
                physics:
                    const NeverScrollableScrollPhysics(), // جعل التمرير بس من خلال السكروال الرئيسي للوديجت
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.isLandscape ? 3 : 2,
                  mainAxisSpacing: context.heightPct(.02),
                  crossAxisSpacing: context.heightPct(.02),
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    final trgetedFoodItem = foodMenu.firstWhere(
                      (item) => item.id == filteredFood[index].id,
                    );
                    final trgetedIndex = foodMenu.indexOf(trgetedFoodItem);

                    Navigator.of(context)
                        .pushNamed(
                          FoodDetailsPage.routeName,
                          arguments: FoodDetailsArg(index: trgetedIndex),
                        )
                        .then((value) {
                          setState(() {});
                          filteredFood = foodMenu;
                          categorySelectedId = "";
                        });
                    // Navigator.of(context)
                    //     .push<String>(
                    //       MaterialPageRoute(
                    //         builder: (context) => FoodDetailsPage(index: index),
                    //       ),
                    //     )
                    //     .then((value) => setState(() {}));
                    //     .then((value) { setState(() {})) } ;
                  },
                  child: FoodGrigeItem(
                    foodIndex: index,
                    filteredFood: filteredFood,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
