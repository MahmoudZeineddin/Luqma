class FoodItemModel {
  final String name;
  final String imageUrl;
  final double price;
  final bool isFavorite;
  final String subtitle; // يظهر تحت الاسم مباشرة
  final String description; // وصف تفصيلي للصفحة

  FoodItemModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
    required this.subtitle,
    required this.description,
  });

  FoodItemModel copyWith({
    String? name,
    String? imageUrl,
    double? price,
    bool? isFavorite,
    String? subtitle,
    String? description,
  }) {
    return FoodItemModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
    );
  }
}

List<FoodItemModel> foodMenu = [
  FoodItemModel(
    name: "Double Burger",
    imageUrl:
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
    price: 9.0,
    subtitle: "Double beef patty with cheddar cheese",
    description:
        "A juicy double beef patty burger layered with fresh lettuce, tomatoes, and cheddar cheese. Perfectly grilled and served with a soft bun. A classic favorite for burger lovers looking for a hearty meal.",
  ),
  FoodItemModel(
    name: "Margherita Pizza",
    imageUrl:
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400',
    price: 10.5,
    subtitle: "Tomato sauce, mozzarella, fresh basil",
    description:
        "Classic Italian pizza topped with rich tomato sauce, fresh mozzarella, and fragrant basil. Baked to perfection with a crispy crust. A simple yet delightful treat for any pizza enthusiast.",
  ),
  FoodItemModel(
    name: "Pasta Pesto",
    imageUrl:
        'https://images.unsplash.com/photo-1473093226795-af9932fe5856?w=400',
    price: 8.3,
    subtitle: "Pasta with fresh basil pesto sauce",
    description:
        "Tender pasta tossed in a creamy pesto sauce made from fresh basil, pine nuts, and parmesan cheese. Lightly seasoned to bring out authentic Italian flavors. Perfect for a flavorful and satisfying meal.",
  ),
  FoodItemModel(
    name: "Beef Steak",
    imageUrl:
        'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=400',
    price: 18.5,
    subtitle: "Grilled premium beef steak",
    description:
        "A premium cut of beef steak grilled to perfection, juicy and tender inside. Served with a side of roasted vegetables or mashed potatoes. Ideal for steak lovers craving a rich and savory experience.",
  ),
  FoodItemModel(
    name: "Salmon Sushi",
    imageUrl:
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=400',
    price: 15.0,
    subtitle: "Fresh salmon slices over sushi rice",
    description:
        "Fresh salmon slices delicately placed over seasoned sushi rice. Served with a hint of wasabi and soy sauce. A perfect choice for sushi lovers seeking fresh and authentic flavors.",
  ),
  FoodItemModel(
    name: "Taco Supreme",
    imageUrl: 'https://images.unsplash.com/photo-1552332386-f8dd00dc2f85?w=400',
    price: 9.5,
    subtitle: "Crispy tacos with beef and veggies",
    description:
        "Crispy taco shells filled with seasoned beef, fresh vegetables, and melted cheese. Topped with a dollop of sour cream and salsa. A flavorful bite that brings Mexican street food to your plate.",
  ),
  FoodItemModel(
    name: "Ceasar Salad",
    imageUrl:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400',
    price: 7.5,
    subtitle: "Romaine lettuce, croutons, parmesan",
    description:
        "Crisp romaine lettuce tossed with creamy Caesar dressing, crunchy croutons, and parmesan cheese. Optionally topped with grilled chicken. A refreshing and classic salad for a light meal.",
  ),
];

// final List<FoodItemModel> foodMenu = [
//   FoodItemModel(
//     name: "كبسة لحم",
//     imageUrl:
//         "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800",
//     price: 45.0,
//   ),
//   FoodItemModel(
//     name: "كبسة دجاج",
//     imageUrl:
//         "https://images.unsplash.com/photo-1628294896516-344152572ee8?w=800",
//     price: 35.0,
//   ),
//   FoodItemModel(
//     name: "مندي لحم",
//     imageUrl:
//         "https://images.unsplash.com/photo-1617196034796-73dfa7b1fd56?w=800",
//     price: 48.0,
//   ),

//   FoodItemModel(
//     name: "مندي دجاج",
//     imageUrl:
//         "https://upload.wikimedia.org/wikipedia/commons/6/6e/Chicken_Mandi.jpg",
//     price: 36.0,
//   ),
//   FoodItemModel(
//     name: "شاورما لحم",
//     imageUrl:
//         "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=800",
//     price: 28.0,
//   ),
//   FoodItemModel(
//     name: "شاورما دجاج",
//     imageUrl:
//         "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800",
//     price: 25.0,
//   ),
// ];
