import '../data/dummy_recipes.dart';
import '../models/meal.dart';

class RecipeRepository {
  List<Meal> getAll() => dummyRecipes;

  List<String> getCategories() =>
      dummyRecipes.map((meal) => meal.category).toSet().toList()..sort();

  Meal? findById(String id) {
    for (final meal in dummyRecipes) {
      if (meal.id == id) return meal;
    }
    return null;
  }

  List<Meal> search({String query = '', String category = ''}) => dummyRecipes
      .where(
        (meal) =>
            (category.isEmpty || meal.category == category) &&
            meal.name.toLowerCase().contains(query.toLowerCase().trim()),
      )
      .toList();
}
