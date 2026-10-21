import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/recipe_schedule.dart';

class ScheduleRepository {
  static const _key = 'recipe_schedules';

  Future<List<RecipeSchedule>> load() async {
    final raw = (await SharedPreferences.getInstance()).getString(_key);
    if (raw == null) return [];
    return (jsonDecode(raw) as List<dynamic>)
        .map((item) => RecipeSchedule.fromMap(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> save(List<RecipeSchedule> schedules) async =>
      (await SharedPreferences.getInstance()).setString(
        _key,
        jsonEncode(schedules.map((item) => item.toMap()).toList()),
      );
}
