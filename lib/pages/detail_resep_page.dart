import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';
import '../controllers/schedule_controller.dart';
import '../models/meal.dart';
import '../widgets/schedule_form.dart';

class DetailResepPage extends StatelessWidget {
  const DetailResepPage({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final favorites = Get.find<FavoriteController>();
    final schedules = Get.find<ScheduleController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () => favorites.toggle(meal),
              icon: Icon(
                favorites.isFavorite(meal.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final content = ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _photo(),
              const SizedBox(height: 18),
              Text(
                meal.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                meal.category,
                style: const TextStyle(
                  color: Color(0xFFF39A22),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Bahan-bahan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ...meal.ingredients.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text('• $item'),
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Langkah Memasak',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ...meal.instructions.indexed.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('${item.$1 + 1}. ${item.$2}'),
                ),
              ),
              const SizedBox(height: 28),
              FilledButton.icon(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => ScheduleForm(
                    meal: meal,
                    onSave: (dateTime, note) => schedules.add(
                      mealId: meal.id,
                      dateTime: dateTime,
                      note: note,
                    ),
                  ),
                ),
                icon: const Icon(Icons.calendar_month),
                label: const Text('Jadwalkan Resep'),
              ),
            ],
          );
          if (orientation == Orientation.portrait) return content;
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: _photo(),
                ),
              ),
              Expanded(child: content),
            ],
          );
        },
      ),
    );
  }

  Widget _photo() => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: AspectRatio(
      aspectRatio: 1.4,
      child: Image.network(
        meal.thumbnail,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const ColoredBox(
          color: Color(0xFFFFE3C4),
          child: Icon(Icons.restaurant, size: 50),
        ),
      ),
    ),
  );
}
