import 'package:get/get.dart';

import '../models/meal.dart';
import '../repositories/favorite_repository.dart';
import '../repositories/recipe_repository.dart';

class FavoriteController extends GetxController {
  FavoriteController(this._repository);

  final FavoriteRepository _repository;
  final ids = <String>{}.obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    ids.assignAll(await _repository.loadIds());
    isLoading.value = false;
  }

  bool isFavorite(String mealId) => ids.contains(mealId);

  List<Meal> get meals =>
      ids.map(Get.find<RecipeRepository>().findById).whereType<Meal>().toList();

  Future<void> toggle(Meal meal) async {
    if (ids.contains(meal.id)) {
      ids.remove(meal.id);
    } else {
      ids.add(meal.id);
    }
    await _repository.saveIds(ids);
  }
}
