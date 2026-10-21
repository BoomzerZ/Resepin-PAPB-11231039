import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categories,
    required this.selected,
    required this.onSelect,
  });

  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final safeCategories = List<String>.from(categories);
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: safeCategories.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, index) {
          if (index == 0)
            return ChoiceChip(
              label: const Text('Semua'),
              selected: selected.isEmpty,
              selectedColor: const Color(0xFFFFE3C4),
              onSelected: (_) => onSelect(''),
            );
          final categoryIndex = index - 1;
          if (categoryIndex < 0 || categoryIndex >= safeCategories.length)
            return const SizedBox.shrink();
          final category = safeCategories[categoryIndex];
          return ChoiceChip(
            label: Text(category),
            selected: category == selected,
            selectedColor: const Color(0xFFFFE3C4),
            onSelected: (_) => onSelect(category),
          );
        },
      ),
    );
  }
}
