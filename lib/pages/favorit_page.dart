import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';
import '../widgets/recipe_list.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoriteController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RecipeList(
          meals: controller.meals,
          emptyMessage: 'Belum ada resep favorit.',
          grid: false,
        );
      }),
    );
  }
}
