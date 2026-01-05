import 'package:food_delivery/utilities/app_assets.dart';

class CategoryItem {
  final String id;
  final String title;
  final String imgPath;

  CategoryItem({required this.id, required this.title, required this.imgPath});
}

final List<CategoryItem> categories = [
  CategoryItem(id: '1', title: 'burger', imgPath: AppAssets.burgerIcon),
  CategoryItem(id: '2', title: 'pizza', imgPath: AppAssets.pizzaIcon),
  CategoryItem(id: '3', title: 'pasta', imgPath: AppAssets.pastaIcon),
  CategoryItem(id: '4', title: 'pasta', imgPath: AppAssets.pastaIcon),
];
