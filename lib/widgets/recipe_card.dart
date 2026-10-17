import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_controller.dart';
import '../models/meal.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.meal, this.width = 225});
  final Meal meal;
  final double width;

  @override
  Widget build(BuildContext context) {
    final favorites = Get.find<FavoriteController>();
    favorites.remember(meal);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/detail', arguments: meal),
      child: Container(
        width: width,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .06), blurRadius: 8, offset: const Offset(0, 3))]),
        clipBehavior: Clip.antiAlias,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: width == 225 ? 150 : 100, child: Stack(fit: StackFit.expand, children: [
            Image.network(meal.thumbnail, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const ColoredBox(color: Color(0xFFFFE3C4), child: Icon(Icons.restaurant, color: Color(0xFF4A2C1A))),),
            Positioned(right: 10, top: 10, child: Obx(() => Material(color: Colors.white, shape: const CircleBorder(), child: IconButton(tooltip: favorites.isFavorite(meal.id) ? 'Hapus dari favorit' : 'Tambah ke favorit', onPressed: () => favorites.toggle(meal), icon: Icon(favorites.isFavorite(meal.id) ? Icons.favorite : Icons.favorite_border, color: const Color(0xFF4A2C1A), size: 20), constraints: const BoxConstraints.tightFor(width: 36, height: 36), padding: EdgeInsets.zero)))),
          ])),
          Padding(padding: const EdgeInsets.fromLTRB(12, 8, 10, 2), child: Text(meal.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF211A15), fontSize: 15, fontWeight: FontWeight.bold))),
          Padding(padding: const EdgeInsets.fromLTRB(12, 3, 10, 0), child: Text(meal.category ?? 'Lihat bahan dan instruksi', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.black54, fontSize: 12))),
        ]),
      ),
    );
  }
}
