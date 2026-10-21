import 'package:get/get.dart';

import '../models/recipe_schedule.dart';
import '../repositories/schedule_repository.dart';

class ScheduleController extends GetxController {
  ScheduleController(this._repository);

  final ScheduleRepository _repository;
  final schedules = <RecipeSchedule>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadSchedules();
  }

  Future<void> loadSchedules() async {
    final loaded = await _repository.load();
    loaded.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    schedules.assignAll(loaded);
    isLoading.value = false;
  }

  Future<void> add({
    required String mealId,
    required DateTime dateTime,
    String note = '',
  }) async {
    schedules.add(
      RecipeSchedule(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        mealId: mealId,
        dateTime: dateTime,
        note: note,
      ),
    );
    schedules.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    schedules.refresh();
    await _repository.save(schedules);
  }

  Future<void> remove(String id) async {
    schedules.removeWhere((item) => item.id == id);
    await _repository.save(schedules);
  }
}
