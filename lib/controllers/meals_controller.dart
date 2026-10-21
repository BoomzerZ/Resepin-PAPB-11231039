import 'package:get/get.dart';

import '../models/meal.dart';
import '../repositories/recipe_repository.dart';

class MealsController extends GetxController {
  MealsController(this._repository);

  final RecipeRepository _repository;
  final recipes = <Meal>[].obs;
  final categories = <String>[].obs;
  final selectedCategory = ''.obs;
  final query = ''.obs;
  final isLoading = true.obs;
  final error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadRecipes();
  }

  void loadRecipes() {
    isLoading.value = true;
    error.value = '';
    try {
      categories.assignAll(_repository.getCategories());
      applyFilters();
    } catch (_) {
      error.value = 'Resep tidak dapat dimuat.';
    } finally {
      isLoading.value = false;
    }
  }

  void search(String value) {
    query.value = value;
    applyFilters();
  }

  void filterByCategory(String category) {
    final normalizedCategory = category.trim();
    selectedCategory.value =
        normalizedCategory.isEmpty ||
            normalizedCategory == selectedCategory.value
        ? ''
        : normalizedCategory;
    applyFilters();
  }

  void applyFilters() {
    error.value = '';
    recipes.assignAll(
      _repository.search(query: query.value, category: selectedCategory.value),
    );
  }

  Meal? findById(String id) => _repository.findById(id);
}
