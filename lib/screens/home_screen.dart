import 'package:flutter/material.dart';
import 'package:quran_app/screens/azkar_categories_screen.dart';
import '../widgets/home_card.dart';
import 'DuaaCategoriesScreen.dart';
import 'PrayerTimesScreen.dart';
import 'RadiosScreen.dart';
import 'surah_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text(
          'الصفحة الرئيسية',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildNavItem(
              context,
              'assets/images/quran_read.jpg',
              'اقرأ القرآن',
              const SurahListScreen(),
            ),
            _buildNavItem(
              context,
              'assets/images/quran_listen.jpg',
              'إذاعة القرآن الكريم',
              const RadioScreen(),
            ),
            _buildNavItem(
              context,
              'assets/images/duaa.jpg',
              'أدعية',
              const DuaaCategoriesScreen(),
            ),
            _buildNavItem(
              context,
              'assets/images/azkar.jpg',
              'أذكار',
              const AzkarCategoriesScreen(),
            ),
            _buildNavItem(
              context,
              'assets/images/prayer_time.jpg',
              'مواقيت الصلاة',
              const PrayerTimesScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, String imagePath, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => screen),
          );
        },
        child: HomeCard(
          title: title,
          imagePath: imagePath,
        ),
      ),
    );
  }
}
