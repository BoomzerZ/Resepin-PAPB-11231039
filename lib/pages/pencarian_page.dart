import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/meals_controller.dart';
import '../widgets/category_list.dart';
import '../widgets/recipe_list.dart';
import '../widgets/search_bar_widget.dart';

class PencarianPage extends StatelessWidget {
  const PencarianPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MealsController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cari Resep')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBarWidget(onChanged: controller.search),
            const SizedBox(height: 12),
            Obx(() {
              final categories = controller.categories.toList();
              final selected = controller.selectedCategory.value;
              return CategoryList(
                categories: categories,
                selected: selected,
                onSelect: controller.filterByCategory,
              );
            }),
            const SizedBox(height: 12),
            Expanded(
              child: Obx(() {
                final loading = controller.isLoading.value;
                final error = controller.error.value;
                final recipes = controller.recipes.toList();

                if (loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (error.isNotEmpty) return Center(child: Text(error));

                return RecipeList(
                  meals: recipes,
                  emptyMessage: 'Resep yang dicari tidak ditemukan.',
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
