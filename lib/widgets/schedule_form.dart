import 'package:flutter/material.dart';

import '../models/meal.dart';

class ScheduleForm extends StatefulWidget {
  const ScheduleForm({super.key, required this.meal, required this.onSave});

  final Meal meal;
  final Future<void> Function(DateTime dateTime, String note) onSave;

  @override
  State<ScheduleForm> createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<ScheduleForm> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  final _note = TextEditingController();

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(
      left: 20,
      right: 20,
      top: 20,
      bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jadwalkan ${widget.meal.name}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            OutlinedButton.icon(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (date != null) setState(() => _date = date);
              },
              icon: const Icon(Icons.calendar_today),
              label: Text('${_date.day}/${_date.month}/${_date.year}'),
            ),
            OutlinedButton.icon(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: _time,
                );
                if (time != null) setState(() => _time = time);
              },
              icon: const Icon(Icons.access_time),
              label: Text(_time.format(context)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _note,
          maxLines: 2,
          decoration: const InputDecoration(
            labelText: 'Catatan (opsional)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () async {
              final dateTime = DateTime(
                _date.year,
                _date.month,
                _date.day,
                _time.hour,
                _time.minute,
              );
              await widget.onSave(dateTime, _note.text.trim());
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Simpan Jadwal'),
          ),
        ),
      ],
    ),
  );
}
