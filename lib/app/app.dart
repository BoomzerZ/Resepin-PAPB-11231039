import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../pages/detail_resep_page.dart';
import '../pages/pencarian_page.dart';
import 'app_routes.dart';
import 'app_shell.dart';
import 'app_theme.dart';

class ResepinApp extends StatelessWidget {
  const ResepinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resepin',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.home,
      onGenerateRoute: (settings) {
        final Widget page;
        switch (settings.name) {
          case AppRoutes.search:
            page = const PencarianPage();
            break;
          case AppRoutes.favorites:
            page = const AppShell(initialIndex: 1);
            break;
          case AppRoutes.schedules:
            page = const AppShell(initialIndex: 2);
            break;
          case AppRoutes.detail:
            page = DetailResepPage(meal: settings.arguments as Meal);
            break;
          case AppRoutes.home:
          default:
            page = const AppShell();
            break;
        }
        return PageRouteBuilder<void>(
          settings: settings,
          pageBuilder: (_, __, ___) => page,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      },
    );
  }
}
