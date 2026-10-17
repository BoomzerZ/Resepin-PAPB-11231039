class Meal {
  const Meal({required this.id, required this.name, required this.thumbnail, this.category, this.instructions, this.ingredients = const []});

  final String id;
  final String name;
  final String thumbnail;
  final String? category;
  final String? instructions;
  final List<String> ingredients;

  factory Meal.fromJson(Map<String, dynamic> json) {
    final ingredients = <String>[];
    for (var i = 1; i <= 20; i++) {
      final ingredient = (json['strIngredient$i'] ?? '').toString().trim();
      final measure = (json['strMeasure$i'] ?? '').toString().trim();
      if (ingredient.isNotEmpty) ingredients.add(measure.isEmpty ? ingredient : '$measure $ingredient');
    }
    return Meal(
      id: (json['idMeal'] ?? '').toString(),
      name: (json['strMeal'] ?? 'Resep tanpa nama').toString(),
      thumbnail: (json['strMealThumb'] ?? '').toString(),
      category: json['strCategory']?.toString(),
      instructions: json['strInstructions']?.toString(),
      ingredients: ingredients,
    );
  }
}
