import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/favorite_controller.dart';
import 'controllers/meals_controller.dart';
import 'models/meal.dart';
import 'pages/detail_resep_page.dart';
import 'pages/favorit_page.dart';
import 'pages/home_page.dart';
import 'pages/pencarian_page.dart';
import 'services/mealdb_service.dart';

void main() {
  Get.put(MealDbService());
  Get.put(MealsController(Get.find<MealDbService>()), permanent: true);
  Get.put(FavoriteController(), permanent: true);
  runApp(const ResepinApp());
}

class ResepinApp extends StatelessWidget {
  const ResepinApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Resepin',
    theme: ThemeData(fontFamily: 'Arial', scaffoldBackgroundColor: const Color(0xFFFFFBF5)),
    initialRoute: '/',
    routes: {
      '/': (_) => const ResepinHomePage(),
      '/pencarian': (_) => const PencarianPage(),
      '/favorit': (_) => const FavoritPage(),
      '/detail': (context) => DetailResepPage(meal: ModalRoute.of(context)!.settings.arguments as Meal),
    },
  );
}
