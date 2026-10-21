class Meal {
  const Meal({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.category,
    required this.ingredients,
    required this.instructions,
  });

  final String id;
  final String name;
  final String thumbnail;
  final String category;
  final List<String> ingredients;
  final List<String> instructions;
}
