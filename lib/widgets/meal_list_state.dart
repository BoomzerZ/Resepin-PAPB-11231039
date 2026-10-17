import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'recipe_card.dart';

class MealListState extends StatelessWidget {
  const MealListState({super.key, required this.loading, required this.error, required this.meals, this.emptyMessage = 'Belum ada resep.'});
  final bool loading;
  final String error;
  final List<Meal> meals;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator(color: Color(0xFFF39A22)));
    if (error.isNotEmpty) return Center(child: Text(error, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54)));
    if (meals.isEmpty) return Center(child: Text(emptyMessage, style: const TextStyle(color: Colors.black54)));
    return ListView.separated(padding: const EdgeInsets.all(16), itemCount: meals.length, separatorBuilder: (_, __) => const SizedBox(height: 12), itemBuilder: (_, i) => SizedBox(height: 164, child: RecipeCard(meal: meals[i], width: 400)));
  }
}
