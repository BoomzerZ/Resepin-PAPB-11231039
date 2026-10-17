import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ResepinApp());
}

class ResepinApp extends StatelessWidget {
  const ResepinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resepin',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFFFFBF5),
      ),
      home: const ResepinHomePage(),
    );
  }
}

class ResepinHomePage extends StatefulWidget {
  const ResepinHomePage({super.key});

  @override
  State<ResepinHomePage> createState() =>
      _ResepinHomePageState();
}

class _ResepinHomePageState extends State<ResepinHomePage> {
  Future<List<dynamic>> getMeals() async {
    final response = await http.get(
      Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=Chicken',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['meals'] ?? [];
    }

    throw Exception('Gagal mengambil data resep');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5),

      body: SafeArea(
        child: Stack(
          children: [
            // =========================================================
            // KONTEN UTAMA
            // =========================================================
            Column(
              children: [
                // =====================================================
                // HEADER
                // =====================================================
                SizedBox(
                  height: 65,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),

                      const Text(
                        '🍳',
                        style: TextStyle(
                          fontSize: 27,
                        ),
                      ),

                      const SizedBox(width: 8),

                      const Text(
                        'Resepin',
                        style: TextStyle(
                          color: Color(0xFF4A2C1A),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Spacer(),

                      const Icon(
                        Icons.notifications_none,
                        color: Color(0xFF4A2C1A),
                        size: 29,
                      ),

                      const SizedBox(width: 18),

                      Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF0DB),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Color(0xFF4A2C1A),
                          size: 22,
                        ),
                      ),

                      const SizedBox(width: 20),
                    ],
                  ),
                ),

                // =====================================================
                // SCROLLABLE CONTENT
                // =====================================================
                Expanded(
                  child: ListView(
                    children: [
                      // =================================================
                      // GREETING
                      // =================================================
                      SizedBox(
                        height: 105,
                        child: Row(
                          children: [
                            const SizedBox(width: 20),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Halo!',
                                    style: TextStyle(
                                      color: Color(0xFFF39A22),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    'Mau masak apa hari ini?',
                                    style: TextStyle(
                                      color: Color(0xFF38251B),
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 5),

                                  Text(
                                    'Temukan resep lezat untuk setiap momen',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 5),

                            const Text(
                              '🍲',
                              style: TextStyle(
                                fontSize: 70,
                              ),
                            ),

                            const SizedBox(width: 15),
                          ],
                        ),
                      ),

                      // =================================================
                      // SEARCH BAR
                      // =================================================
                      const SizedBox(height: 20),

                      SizedBox(
                        height: 35,
                        child: Row(
                          children: [
                            const SizedBox(width: 20),

                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: const Color(0xFFE7E0D8),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    SizedBox(width: 16),

                                    Icon(
                                      Icons.search,
                                      color: Colors.black54,
                                      size: 28,
                                    ),

                                    SizedBox(width: 12),

                                    Expanded(
                                      child: Text(
                                        'Cari resep makanan...',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 16),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(width: 20),
                          ],
                        ),
                      ),

                      // =================================================
                      // KATEGORI
                      // =================================================
                      const SizedBox(height: 15),

                      SizedBox(
                        height: 140,
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                SizedBox(width: 20),

                                Text(
                                  'Kategori',
                                  style: TextStyle(
                                    color: Color(0xFF211A15),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Spacer(),

                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                  ),
                                ),

                                SizedBox(width: 5),

                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.black54,
                                  size: 20,
                                ),

                                SizedBox(width: 18),
                              ],
                            ),

                            const SizedBox(height: 12),

                            SizedBox(
                              height: 95,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  const SizedBox(width: 20),

                                  categoryItem(
                                    '🍚',
                                    'Nasi',
                                    const Color(0xFFFFE3C4),
                                  ),

                                  categoryItem(
                                    '🍜',
                                    'Mie',
                                    const Color(0xFFFFE9AE),
                                  ),

                                  categoryItem(
                                    '🍗',
                                    'Ayam',
                                    const Color(0xFFFFD1CF),
                                  ),

                                  categoryItem(
                                    '🐟',
                                    'Ikan',
                                    const Color(0xFFD6E9FF),
                                  ),

                                  categoryItem(
                                    '🥬',
                                    'Sayur',
                                    const Color(0xFFE1F2D0),
                                  ),

                                  const SizedBox(width: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // =================================================
                      // RESEP POPULER
                      // =================================================
                      const SizedBox(height: 22),

                      Row(
                        children: const [
                          SizedBox(width: 20),

                          Text(
                            'Resep Populer',
                            style: TextStyle(
                              color: Color(0xFF211A15),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Spacer(),

                          Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                          ),

                          SizedBox(width: 5),

                          Icon(
                            Icons.chevron_right,
                            color: Colors.black54,
                            size: 20,
                          ),

                          SizedBox(width: 18),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // =================================================
                      // PRODUCT / RECIPE CARDS
                      // =================================================
                      SizedBox(
                        height: 250,
                        child: FutureBuilder<List<dynamic>>(
                          future: getMeals(),
                          builder: (context, snapshot) {

                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (snapshot.hasError) {
                              return const Center(
                                child: Text('Gagal mengambil data resep'),
                              );
                            }

                            final meals = snapshot.data ?? [];

                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                const SizedBox(width: 20),

                                ...meals.take(5).map((meal) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: recipeCard(
                                      image: meal['strMealThumb'],
                                      title: meal['strMeal'],
                                      rating: '4.8',
                                      duration: '30 menit',
                                    ),
                                  );
                                }),

                                const SizedBox(width: 8),
                              ],
                            );
                          },
                        ),
                      ),

                      // =================================================
                      // REKOMENDASI
                      // =================================================
                      const SizedBox(height: 45),

                      const SizedBox(
                        height: 30,
                        child: Row(
                          children: [
                            SizedBox(width: 20),

                            Text(
                              'Rekomendasi Untukmu',
                              style: TextStyle(
                                color: Color(0xFF211A15),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      SizedBox(
                        height: 115,
                        child: Row(
                          children: [
                            const SizedBox(width: 20),

                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF3DF),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 8),

                                    Container(
                                      width: 100,
                                      height: 99,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(14),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1515003197210-e0cd71810b5f',
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    const SizedBox(width: 14),

                                    const Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Seblak Pedas',
                                            style: TextStyle(
                                              color: Color(0xFF211A15),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(height: 8),

                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Color(0xFFFFA31A),
                                                size: 18,
                                              ),

                                              SizedBox(width: 5),

                                              Text(
                                                '4.7',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              SizedBox(width: 8),

                                              Text(
                                                '• 30 menit',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.chevron_right,
                                        color: Color(0xFF4A2C1A),
                                      ),
                                    ),

                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(width: 20),
                          ],
                        ),
                      ),

                      // Ruang supaya konten terakhir tidak tertutup navbar
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),

            // =========================================================
            // BOTTOM NAVIGATION
            // =========================================================
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBF5),
                  border: Border(
                    top: BorderSide(
                      color: Colors.black.withValues(alpha: 0.08),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    bottomItem(
                      Icons.home_rounded,
                      'Beranda',
                      true,
                    ),

                    bottomItem(
                      Icons.search,
                      'Cari',
                      false,
                    ),

                    bottomItem(
                      Icons.favorite_border,
                      'Favorit',
                      false,
                    ),

                    bottomItem(
                      Icons.person_outline,
                      'Profil',
                      false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===============================================================
  // CATEGORY ITEM
  // ===============================================================

  static Widget categoryItem(
      String emoji,
      String title,
      Color backgroundColor,
      ) {
    return SizedBox(
      width: 75,
      child: Column(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: Alignment.center,
            child: Text(
              emoji,
              style: const TextStyle(
                fontSize: 31,
              ),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF211A15),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ===============================================================
  // RECIPE CARD
  // ===============================================================

  static Widget recipeCard({
    required String image,
    required String title,
    required String rating,
    required String duration,
  }) {
    return Container(
      width: 225,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Color(0xFF4A2C1A),
                      size: 21,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF211A15),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Color(0xFFFFA31A),
                  size: 17,
                ),

                const SizedBox(width: 5),

                Text(
                  rating,
                  style: const TextStyle(
                    color: Color(0xFF211A15),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 8),

                Text(
                  '•  $duration',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===============================================================
  // BOTTOM NAVIGATION ITEM
  // ===============================================================

  static Widget bottomItem(
      IconData icon,
      String title,
      bool active,
      ) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: active
                ? const Color(0xFFF39A22)
                : Colors.black45,
            size: 27,
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: TextStyle(
              color: active
                  ? const Color(0xFFF39A22)
                  : Colors.black45,
              fontSize: 11,
              fontWeight:
              active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}