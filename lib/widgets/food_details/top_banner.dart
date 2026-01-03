import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class TopBanner extends StatelessWidget {
  final FoodItemModel foodItemModel;
  final VoidCallback onFavoriteToggle;
  const TopBanner({
    super.key,
    required this.foodItemModel,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          foodItemModel.imageUrl,
          width: double.infinity,
          fit: BoxFit.contain,
        ),

        Positioned(
          top: 8,
          left: 8,
          child: _iconContainer(
            icon: Icons.chevron_left,
            iconColor: Colors.red,
            onTap: () => Navigator.pop(context),
          ),
        ),

        Positioned(
          top: 8,
          right: 8,
          child: _iconContainer(
            icon: foodItemModel.isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
            iconColor: Colors.red,
            onTap: onFavoriteToggle,
          ),
        ),
      ],
    );
  }
}

Widget _iconContainer({
  required IconData icon,
  required VoidCallback onTap,
  Color iconColor = Colors.black,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: iconColor),
    ),
  );
}
