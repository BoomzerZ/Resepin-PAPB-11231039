import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/meals_controller.dart';
import '../controllers/schedule_controller.dart';
import '../widgets/empty_state.dart';
import '../widgets/schedule_card.dart';

class JadwalResepPage extends StatelessWidget {
  const JadwalResepPage({super.key});

  @override
  Widget build(BuildContext context) {
    final schedules = Get.find<ScheduleController>();
    final meals = Get.find<MealsController>();
    return Obx(() {
      final loading = schedules.isLoading.value;
      final items = schedules.schedules.toList();
      if (loading) return const Center(child: CircularProgressIndicator());
      if (items.isEmpty)
        return const EmptyState(
          message: 'Belum ada jadwal resep.',
          icon: Icons.calendar_month,
        );
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, index) {
          final schedule = items[index];
          final meal = meals.findById(schedule.mealId);
          if (meal == null) return const SizedBox.shrink();
          return ScheduleCard(
            schedule: schedule,
            meal: meal,
            onDelete: () => schedules.remove(schedule.id),
          );
        },
      );
    });
  }
}
