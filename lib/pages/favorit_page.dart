import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_controller.dart';
import '../widgets/meal_list_state.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoriteController>();
    return Scaffold(appBar: AppBar(title: const Text('Resep Favorit'), backgroundColor: const Color(0xFFFFFBF5), foregroundColor: const Color(0xFF4A2C1A), elevation: 0), body: Obx(() => MealListState(loading: false, error: '', meals: controller.favorites.toList(), emptyMessage: 'Belum ada resep favorit.')));
  }
}
