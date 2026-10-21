import 'package:flutter/material.dart';
import '../pages/favorit_page.dart';
import '../pages/home_page.dart';
import '../pages/jadwal_resep_page.dart';
import '../widgets/bottom_nav_bar.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  static const _titles = ['Resepin', 'Resep Favorit', 'Jadwal Resep'];
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          ResepinHomePage(),
          FavoritPage(),
          JadwalResepPage(),
        ],
      ),
      bottomNavigationBar: ColoredBox(
        color: const Color(0xFFFFE9DD),
        child: SafeArea(
          top: false,
          child: BottomNavBar(
            currentIndex: _currentIndex,
            onSelected: (index) => setState(() => _currentIndex = index),
          ),
        ),
      ),
    );
  }
}
