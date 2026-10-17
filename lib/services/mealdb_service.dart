import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal.dart';

class MealDbService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Meal>> _fetchList(Uri uri) async {
    final response = await http.get(uri);
    if (response.statusCode != 200) throw Exception('Gagal mengambil data resep');
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final meals = data['meals'] as List<dynamic>? ?? [];
    return meals.map((item) => Meal.fromJson(item as Map<String, dynamic>)).toList();
  }

  Future<List<Meal>> getMealsByCategory(String category) =>
      _fetchList(Uri.parse('$baseUrl/filter.php?c=${Uri.encodeComponent(category)}'));

  Future<List<Meal>> getPopularMeals() => getMealsByCategory('Chicken');

  Future<List<Meal>> searchMeals(String keyword) =>
      _fetchList(Uri.parse('$baseUrl/search.php?s=${Uri.encodeComponent(keyword)}'));

  Future<List<String>> getCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/list.php?c=list'));
    if (response.statusCode != 200) throw Exception('Gagal mengambil kategori');
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return (data['meals'] as List<dynamic>? ?? [])
        .map((item) => (item as Map<String, dynamic>)['strCategory'].toString()).toList();
  }

  Future<Meal?> getMealDetail(String id) async {
    final meals = await _fetchList(Uri.parse('$baseUrl/lookup.php?i=${Uri.encodeComponent(id)}'));
    return meals.isEmpty ? null : meals.first;
  }
}
