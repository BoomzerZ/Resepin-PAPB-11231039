import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/app_routes.dart';
import '../controllers/favorite_controller.dart';
import '../models/meal.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.meal, this.compact = false});

  final Meal meal;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final favorites = Get.find<FavoriteController>();
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, AppRoutes.detail, arguments: meal),
      borderRadius: BorderRadius.circular(17),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: compact
            ? Row(
                children: [
                  _image(100),
                  Expanded(child: _text()),
                  _favorite(favorites),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        _image(double.infinity),
                        Positioned(
                          top: 6,
                          right: 6,
                          child: _favorite(favorites),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 9, 12, 10),
                    child: _text(),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _image(double width) => Image.network(
    meal.thumbnail,
    width: width,
    fit: BoxFit.cover,
    errorBuilder: (_, __, ___) => const ColoredBox(
      color: Color(0xFFFFE3C4),
      child: Icon(Icons.restaurant, color: Color(0xFF4A2C1A)),
    ),
  );

  Widget _text() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        meal.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF211A15),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        meal.category,
        style: const TextStyle(color: Color(0xFFF39A22), fontSize: 12),
      ),
    ],
  );

  Widget _favorite(FavoriteController controller) => Obx(
    () => IconButton(
      onPressed: () => controller.toggle(meal),
      icon: Icon(
        controller.isFavorite(meal.id) ? Icons.favorite : Icons.favorite_border,
        color: const Color(0xFF4A2C1A),
      ),
    ),
  );
}
