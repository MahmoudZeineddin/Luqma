import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class TopBanner extends StatefulWidget {
  final int index;
  const TopBanner({super.key, required this.index});

  @override
  State<TopBanner> createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          foodMenu[widget.index].imageUrl,
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
            icon: foodMenu[widget.index].isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
            iconColor: const Color.fromRGBO(244, 67, 54, 1),
            onTap: () {
              setState(() {
                foodMenu[widget.index] = foodMenu[widget.index].copyWith(
                  isFavorite: !foodMenu[widget.index].isFavorite,
                );
              });
            },
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
