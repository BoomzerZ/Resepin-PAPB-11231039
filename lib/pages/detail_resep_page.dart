import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_controller.dart';
import '../controllers/meals_controller.dart';
import '../models/meal.dart';

class DetailResepPage extends StatefulWidget {
  const DetailResepPage({super.key, required this.meal});
  final Meal meal;
  @override
  State<DetailResepPage> createState() => _DetailResepPageState();
}

class _DetailResepPageState extends State<DetailResepPage> {
  final controller = Get.find<MealsController>();
  final favorites = Get.find<FavoriteController>();
  @override
  void initState() { super.initState(); favorites.remember(widget.meal); controller.loadDetail(widget.meal.id); }

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(backgroundColor: const Color(0xFFFFFBF5), foregroundColor: const Color(0xFF4A2C1A), title: const Text('Detail Resep'), actions: [Obx(() => IconButton(onPressed: () => favorites.toggle(controller.detail.value ?? widget.meal), icon: Icon(favorites.isFavorite(widget.meal.id) ? Icons.favorite : Icons.favorite_border, color: const Color(0xFF4A2C1A))))]), body: Obx(() {
    if (controller.detailLoading.value) return const Center(child: CircularProgressIndicator(color: Color(0xFFF39A22)));
    if (controller.detailError.value.isNotEmpty) return Center(child: Padding(padding: const EdgeInsets.all(24), child: Text(controller.detailError.value, textAlign: TextAlign.center)));
    final meal = controller.detail.value!;
    return ListView(padding: const EdgeInsets.only(bottom: 28), children: [
      AspectRatio(aspectRatio: 1.4, child: Image.network(meal.thumbnail, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const ColoredBox(color: Color(0xFFFFE3C4), child: Icon(Icons.restaurant, size: 64)))),
      Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 6), child: Text(meal.name, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF211A15)))),
      if (meal.category?.isNotEmpty ?? false) Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(meal.category!, style: const TextStyle(color: Color(0xFFF39A22), fontWeight: FontWeight.w600))),
      const Padding(padding: EdgeInsets.fromLTRB(20, 22, 20, 8), child: Text('Bahan-bahan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF211A15)))),
      if (meal.ingredients.isEmpty) const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Informasi bahan tidak tersedia.')) else ...meal.ingredients.map((item) => Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('•  '), Expanded(child: Text(item))]))),
      const Padding(padding: EdgeInsets.fromLTRB(20, 22, 20, 8), child: Text('Cara Memasak', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF211A15)))),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text((meal.instructions ?? '').trim().isEmpty ? 'Instruksi tidak tersedia.' : meal.instructions!.trim(), style: const TextStyle(height: 1.55))),
    ]);
  }));
}
