import 'package:get/get.dart';
import '../models/meal.dart';
import '../services/mealdb_service.dart';

class MealsController extends GetxController {
  MealsController(this.service);
  final MealDbService service;
  final popular = <Meal>[].obs;
  final categories = <String>[].obs;
  final categoriesLoading = true.obs;
  final categoriesError = ''.obs;
  final searchResults = <Meal>[].obs;
  final RxBool homeLoading = true.obs;
  final RxBool searchLoading = false.obs;
  final RxString homeError = ''.obs;
  final RxString searchError = ''.obs;
  final Rx<Meal?> detail = Rx<Meal?>(null);
  final RxBool detailLoading = false.obs;
  final RxString detailError = ''.obs;
  final RxString selectedCategory = ''.obs;

  @override
  void onInit() { super.onInit(); loadHome(); loadCategories(); }

  Future<void> loadHome() async {
    homeLoading.value = true; homeError.value = '';
    try { popular.assignAll(await service.getPopularMeals()); }
    catch (_) { homeError.value = 'Gagal mengambil resep. Periksa koneksi lalu coba lagi.'; }
    finally { homeLoading.value = false; }
  }

  Future<void> loadCategories() async {
    categoriesLoading.value = true; categoriesError.value = '';
    try { categories.assignAll(await service.getCategories()); }
    catch (_) { categoriesError.value = 'Kategori tidak dapat dimuat.'; }
    finally { categoriesLoading.value = false; }
  }

  Future<void> selectCategory(String category) async {
    selectedCategory.value = category;
    homeLoading.value = true; homeError.value = '';
    try { popular.assignAll(await service.getMealsByCategory(category)); }
    catch (_) { homeError.value = 'Gagal mengambil resep kategori ini.'; }
    finally { homeLoading.value = false; }
  }

  Future<void> search(String keyword) async {
    if (keyword.trim().isEmpty) { searchResults.clear(); searchError.value = ''; return; }
    searchLoading.value = true; searchError.value = '';
    try { searchResults.assignAll(await service.searchMeals(keyword.trim())); }
    catch (_) { searchError.value = 'Pencarian gagal. Periksa koneksi lalu coba lagi.'; }
    finally { searchLoading.value = false; }
  }

  Future<void> loadDetail(String id) async {
    detailLoading.value = true; detailError.value = ''; detail.value = null;
    try { detail.value = await service.getMealDetail(id); if (detail.value == null) detailError.value = 'Detail resep tidak ditemukan.'; }
    catch (_) { detailError.value = 'Gagal mengambil detail resep.'; }
    finally { detailLoading.value = false; }
  }
}
