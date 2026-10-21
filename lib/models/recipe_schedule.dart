class RecipeSchedule {
  const RecipeSchedule({
    required this.id,
    required this.mealId,
    required this.dateTime,
    this.note = '',
  });

  final String id;
  final String mealId;
  final DateTime dateTime;
  final String note;

  Map<String, String> toMap() => {
    'id': id,
    'mealId': mealId,
    'dateTime': dateTime.toIso8601String(),
    'note': note,
  };

  factory RecipeSchedule.fromMap(Map<String, dynamic> map) => RecipeSchedule(
    id: map['id'] as String,
    mealId: map['mealId'] as String,
    dateTime: DateTime.parse(map['dateTime'] as String),
    note: map['note'] as String? ?? '',
  );
}
