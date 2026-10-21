import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../models/recipe_schedule.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.schedule,
    required this.meal,
    required this.onDelete,
  });

  final RecipeSchedule schedule;
  final Meal meal;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final time = TimeOfDay.fromDateTime(schedule.dateTime).format(context);
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(meal.thumbnail)),
        title: Text(meal.name),
        subtitle: Text(
          '${schedule.dateTime.day}/${schedule.dateTime.month}/${schedule.dateTime.year} • $time${schedule.note.isEmpty ? '' : '\n${schedule.note}'}',
        ),
        isThreeLine: schedule.note.isNotEmpty,
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
        ),
      ),
    );
  }
}
