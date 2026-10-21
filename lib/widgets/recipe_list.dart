import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'empty_state.dart';
import 'recipe_card.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({
    super.key,
    required this.meals,
    this.grid = false,
    this.emptyMessage = 'Resep tidak ditemukan.',
  });

  final List<Meal> meals;
  final bool grid;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    final safeMeals = List<Meal>.from(meals);
    if (safeMeals.isEmpty) return EmptyState(message: emptyMessage);
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 700 ? 3 : 2;
        if (grid)
          return GridView.builder(
            itemCount: safeMeals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              childAspectRatio: .78,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (_, index) => RecipeCard(meal: safeMeals[index]),
          );
        return ListView.separated(
          itemCount: safeMeals.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (_, index) => SizedBox(
            height: 105,
            child: RecipeCard(meal: safeMeals[index], compact: true),
          ),
        );
      },
    );
  }
}
