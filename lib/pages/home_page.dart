import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/meals_controller.dart';
import '../widgets/recipe_card.dart';

class ResepinHomePage extends StatelessWidget {
  const ResepinHomePage({super.key});
  static const _brown = Color(0xFF4A2C1A);
  static const _orange = Color(0xFFF39A22);

  @override
  Widget build(BuildContext context) {
    final meals = Get.find<MealsController>();
    final categoryColors = [const Color(0xFFFFE3C4), const Color(0xFFFFE9AE), const Color(0xFFFFD1CF), const Color(0xFFD6E9FF), const Color(0xFFE1F2D0)];
    final categoryIcons = [Icons.rice_bowl, Icons.ramen_dining, Icons.set_meal, Icons.soup_kitchen, Icons.eco];
    return Scaffold(backgroundColor: const Color(0xFFFFFBF5), body: SafeArea(child: Column(children: [
      SizedBox(height: 65, child: Row(children: [const SizedBox(width: 20), const Text('🍳', style: TextStyle(fontSize: 27)), const SizedBox(width: 8), const Text('Resepin', style: TextStyle(color: _brown, fontSize: 26, fontWeight: FontWeight.bold)), const Spacer(), const Icon(Icons.notifications_none, color: _brown, size: 29), const SizedBox(width: 18), Container(width: 38, height: 38, decoration: const BoxDecoration(color: Color(0xFFFFF0DB), shape: BoxShape.circle), child: const Icon(Icons.person, color: _brown, size: 22)), const SizedBox(width: 20)])),
      Expanded(child: ListView(children: [
        SizedBox(height: 105, child: Row(children: [const SizedBox(width: 20), const Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Halo!', style: TextStyle(color: _orange, fontSize: 25, fontWeight: FontWeight.bold)), SizedBox(height: 4), Text('Mau masak apa hari ini?', style: TextStyle(color: Color(0xFF38251B), fontSize: 21, fontWeight: FontWeight.bold)), SizedBox(height: 5), Text('Temukan resep lezat untuk setiap momen', style: TextStyle(color: Colors.black54, fontSize: 13))])), const Text('🍲', style: TextStyle(fontSize: 65)), const SizedBox(width: 15)])),
        const SizedBox(height: 20),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: InkWell(onTap: () => Navigator.pushNamed(context, '/pencarian'), borderRadius: BorderRadius.circular(15), child: Container(height: 45, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: const Color(0xFFE7E0D8))), child: const Row(children: [SizedBox(width: 16), Icon(Icons.search, color: Colors.black54, size: 25), SizedBox(width: 12), Text('Cari resep makanan...', style: TextStyle(color: Colors.black45, fontSize: 15))])))),
        const SizedBox(height: 20),
        const _SectionTitle('Kategori'),
        SizedBox(height: 102, child: Obx(() => meals.categoriesLoading.value ? const Center(child: CircularProgressIndicator()) : meals.categoriesError.value.isNotEmpty ? Center(child: Text(meals.categoriesError.value)) : ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 20), children: [for (var i = 0; i < meals.categories.length; i++) InkWell(onTap: () => meals.selectCategory(meals.categories[i]), child: SizedBox(width: 78, child: Column(children: [Container(width: 66, height: 66, decoration: BoxDecoration(color: categoryColors[i % categoryColors.length], borderRadius: BorderRadius.circular(18)), child: Icon(categoryIcons[i % categoryIcons.length], color: _brown, size: 30)), const SizedBox(height: 6), Text(meals.categories[i], maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: Color(0xFF211A15)))])))]))),
        const SizedBox(height: 18),
        Obx(() => _SectionTitle(meals.selectedCategory.value.isEmpty ? 'Resep Populer' : 'Kategori: ${meals.selectedCategory.value}')),
        const SizedBox(height: 12),
        SizedBox(height: 250, child: Obx(() { if (meals.homeLoading.value) return const Center(child: CircularProgressIndicator(color: _orange)); if (meals.homeError.value.isNotEmpty) return Center(child: Text(meals.homeError.value, textAlign: TextAlign.center)); if (meals.popular.isEmpty) return const Center(child: Text('Tidak ada resep untuk ditampilkan.')); return ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 20), children: [for (final meal in meals.popular.take(10)) Padding(padding: const EdgeInsets.only(right: 12), child: RecipeCard(meal: meal))]); })),
        const SizedBox(height: 32),
        const _SectionTitle('Rekomendasi Untukmu'),
        const SizedBox(height: 12),
        SizedBox(height: 235, child: Obx(() => meals.popular.length > 5 ? ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 20), children: [for (final meal in meals.popular.skip(5).take(5)) Padding(padding: const EdgeInsets.only(right: 12), child: RecipeCard(meal: meal))]) : const Center(child: Text('Jelajahi lebih banyak kategori resep.')))),
        const SizedBox(height: 90),
      ])),
      Container(height: 72, decoration: BoxDecoration(color: const Color(0xFFFFFBF5), border: Border(top: BorderSide(color: Colors.black.withValues(alpha: .08)))), child: Row(children: [const _NavItem(icon: Icons.home_rounded, label: 'Beranda', selected: true), _NavItem(icon: Icons.search, label: 'Cari', onTap: () => Navigator.pushNamed(context, '/pencarian')), _NavItem(icon: Icons.favorite_border, label: 'Favorit', onTap: () => Navigator.pushNamed(context, '/favorit')), const _NavItem(icon: Icons.person_outline, label: 'Profil')]))
    ])));
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);
  final String title;
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(title, style: const TextStyle(color: Color(0xFF211A15), fontSize: 22, fontWeight: FontWeight.bold)));
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label, this.selected = false, this.onTap});
  final IconData icon; final String label; final bool selected; final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Expanded(child: InkWell(onTap: onTap, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: selected ? const Color(0xFFF39A22) : Colors.black45, size: 26), const SizedBox(height: 3), Text(label, style: TextStyle(color: selected ? const Color(0xFFF39A22) : Colors.black45, fontSize: 11, fontWeight: selected ? FontWeight.bold : FontWeight.normal))])));
}
