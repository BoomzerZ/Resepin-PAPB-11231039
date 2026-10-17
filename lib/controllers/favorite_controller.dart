import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/mealdb_service.dart';
import '../models/meal.dart';

class FavoriteController extends GetxController {
  static const _key = 'favorite_meal_ids';
  final favorites = <Meal>[].obs;
  final ids = <String>{}.obs;

  @override
  void onInit() { super.onInit(); _restore(); }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    ids.addAll(prefs.getStringList(_key) ?? []);
    final service = Get.find<MealDbService>();
    final restored = await Future.wait(ids.map((id) async {
      try { return await service.getMealDetail(id); } catch (_) { return null; }
    }));
    favorites.assignAll(restored.whereType<Meal>());
  }

  bool isFavorite(String id) => ids.contains(id);

  Future<void> toggle(Meal meal) async {
    if (ids.contains(meal.id)) {
      ids.remove(meal.id); favorites.removeWhere((item) => item.id == meal.id);
    } else {
      ids.add(meal.id); favorites.add(meal);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, ids.toList());
  }

  void remember(Meal meal) {
    if (ids.contains(meal.id) && !favorites.any((item) => item.id == meal.id)) favorites.add(meal);
  }
}
