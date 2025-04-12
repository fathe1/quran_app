import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/manger/surah_manager.dart';
import '../screens/surah_detail_screen.dart';

class SurahListScreen extends StatefulWidget {
  const SurahListScreen({super.key});

  @override
  State<SurahListScreen> createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<SurahManager>(context, listen: false).loadSurahs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "القرآن الكريم",
          style: TextStyle(fontFamily: 'Amiri', fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Consumer<SurahManager>(
        builder: (context, surahManager, child) {
          if (surahManager.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: surahManager.surahs.length,
            itemBuilder: (context, index) {
              final surah = surahManager.surahs[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.shade100,
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      )
                    ],
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        surah.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Amiri',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SurahDetailScreen(surahNumber: surah.number),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
