import 'dart:convert';
import 'package:http/http.dart' as http;

class MealDbService {
  static const String baseUrl =
      'https://www.themealdb.com/api/json/v1/1';

  Future<List<dynamic>> getMealsByCategory(String category) async {
    final response = await http.get(
      Uri.parse('$baseUrl/filter.php?c=$category'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['meals'] ?? [];
    }

    throw Exception('Gagal mengambil data resep');
  }

  Future<List<dynamic>> searchMeals(String keyword) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/search.php?s=${Uri.encodeComponent(keyword)}',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['meals'] ?? [];
    }

    throw Exception('Gagal mencari resep');
  }

  Future<Map<String, dynamic>?> getMealDetail(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/lookup.php?i=$id'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['meals'] != null && data['meals'].isNotEmpty) {
        return data['meals'][0];
      }
    }

    return null;
  }
}