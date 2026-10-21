import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/meals_controller.dart';
import '../widgets/category_list.dart';
import '../widgets/recipe_list.dart';
import '../widgets/search_bar_widget.dart';

class ResepinHomePage extends StatelessWidget {
  const ResepinHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MealsController>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Halo!',
            style: TextStyle(
              color: Color(0xFFF39A22),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Mau Masak Apa Hari Ini?',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SearchBarWidget(
            readOnly: true,
            onTap: () => Navigator.pushNamed(context, '/pencarian'),
            onChanged: (_) {},
          ),
          const SizedBox(height: 20),
          const Text(
            'Kategori',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Obx(() {
            final categories = controller.categories.toList();
            final selected = controller.selectedCategory.value;
            return CategoryList(
              categories: categories,
              selected: selected,
              onSelect: controller.filterByCategory,
            );
          }),
          const SizedBox(height: 14),
          const Text(
            'Resep Populer',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              final loading = controller.isLoading.value;
              final error = controller.error.value;
              final recipes = controller.recipes.toList();
              if (loading)
                return const Center(child: CircularProgressIndicator());
              if (error.isNotEmpty) return Center(child: Text(error));
              return RecipeList(meals: recipes, grid: true);
            }),
          ),
        ],
      ),
    );
  }
}
