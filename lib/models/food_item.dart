class FoodItemModel {
  final String name;
  final String imageUrl;
  final double price;

  FoodItemModel({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

List<FoodItemModel> foodMenu = [
  FoodItemModel(
    name: "Double Burger",
    imageUrl:
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
    price: 9.0,
  ),
  FoodItemModel(
    name: "Margherita Pizza",
    imageUrl:
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400',
    price: 10.5,
  ),
  FoodItemModel(
    name: "Crispy Fries",
    imageUrl:
        'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400',
    price: 4.0,
  ),
  FoodItemModel(
    name: "Pasta Pesto",
    imageUrl:
        'https://images.unsplash.com/photo-1473093226795-af9932fe5856?w=400',
    price: 8.3,
  ),
  FoodItemModel(
    name: "Beef Steak",
    imageUrl:
        'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=400',
    price: 18.5,
  ),
  FoodItemModel(
    name: "Salmon Sushi",
    imageUrl:
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=400',
    price: 15.0,
  ),
  FoodItemModel(
    name: "Taco Supreme",
    imageUrl: 'https://images.unsplash.com/photo-1552332386-f8dd00dc2f85?w=400',
    price: 9.5,
  ),
  FoodItemModel(
    name: "Ceasar Salad",
    imageUrl:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400',
    price: 7.5,
  ),
];
