import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepository {
  static const _key = 'favorite_recipe_ids';

  Future<Set<String>> loadIds() async =>
      (await SharedPreferences.getInstance()).getStringList(_key)?.toSet() ??
      {};

  Future<void> saveIds(Set<String> ids) async =>
      (await SharedPreferences.getInstance()).setStringList(_key, ids.toList());
}
