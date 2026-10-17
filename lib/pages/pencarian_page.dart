import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/meals_controller.dart';
import '../widgets/meal_list_state.dart';

class PencarianPage extends StatefulWidget {
  const PencarianPage({super.key});
  @override
  State<PencarianPage> createState() => _PencarianPageState();
}

class _PencarianPageState extends State<PencarianPage> {
  final _input = TextEditingController();
  Timer? _debounce;
  final controller = Get.find<MealsController>();
  @override
  void dispose() { _debounce?.cancel(); _input.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Cari Resep'), backgroundColor: const Color(0xFFFFFBF5), foregroundColor: const Color(0xFF4A2C1A), elevation: 0), body: Column(children: [
    Padding(padding: const EdgeInsets.fromLTRB(16, 8, 16, 12), child: TextField(controller: _input, textInputAction: TextInputAction.search, onSubmitted: controller.search, onChanged: (value) { _debounce?.cancel(); _debounce = Timer(const Duration(milliseconds: 450), () => controller.search(value)); }, decoration: InputDecoration(hintText: 'Cari resep makanan...', prefixIcon: const Icon(Icons.search), suffixIcon: IconButton(onPressed: () { _input.clear(); controller.search(''); }, icon: const Icon(Icons.close)), filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(0xFFE7E0D8))))),),
    Expanded(child: Obx(() => MealListState(loading: controller.searchLoading.value, error: controller.searchError.value, meals: controller.searchResults.toList(), emptyMessage: _input.text.isEmpty ? 'Masukkan nama resep untuk mulai mencari.' : 'Resep tidak ditemukan.'))),
  ]));
}
