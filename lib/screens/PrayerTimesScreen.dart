import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/manger/PrayerTimesManager.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PrayerTimesManager()..fetchPrayerTimes(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF3E8FF),
        appBar: AppBar(
          title: const Text(
            'القاهرة - مصر',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Consumer<PrayerTimesManager>(
          builder: (context, manager, child) {
            if (manager.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (manager.prayerTimes == null) {
              return const Center(child: Text('حدث خطأ أثناء جلب البيانات.'));
            } else {
              final times = manager.prayerTimes!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Text(
                        'مواقيت الصلاة',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          PrayerTimeCard(
                              title: 'الفجر',
                              time: times.fajr,
                              icon: Icons.bedtime_outlined),
                          PrayerTimeCard(
                              title: 'الشروق',
                              time: times.sunrise,
                              icon: Icons.wb_sunny_outlined),
                          PrayerTimeCard(
                              title: 'الظهر',
                              time: times.dhuhr,
                              icon: Icons.access_time),
                          PrayerTimeCard(
                              title: 'العصر',
                              time: times.asr,
                              icon: Icons.sunny),
                          PrayerTimeCard(
                              title: 'المغرب',
                              time: times.maghrib,
                              icon: Icons.nightlight_round),
                          PrayerTimeCard(
                              title: 'العشاء',
                              time: times.isha,
                              icon: Icons.brightness_3),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class PrayerTimeCard extends StatelessWidget {
  final String title;
  final String time;
  final IconData icon;

  const PrayerTimeCard({
    super.key,
    required this.title,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.shade100.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Amiri', // أو أي خط تفضله
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontFamily: 'Amiri',
            ),
          ),
        ],
      ),
    );
  }
}
