import 'package:flutter/material.dart';
import '../model/ayah_model.dart';
import '../network/api_service.dart';

class SurahDetailScreen extends StatefulWidget {
  final int surahNumber;

  const SurahDetailScreen({super.key, required this.surahNumber});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  List<Ayah> verses = [];
  bool isLoading = true;
  String surahName = '';

  @override
  void initState() {
    super.initState();
    fetchSurahDetails();
  }

  Future<void> fetchSurahDetails() async {
    final apiService = ApiService();
    final fetchedVerses = await apiService.fetchSurahVerses(widget.surahNumber);
    final surahs = await apiService.fetchSurahs();
    final selectedSurah =
        surahs.firstWhere((s) => s.number == widget.surahNumber);

    setState(() {
      verses = fetchedVerses;
      surahName = selectedSurah.name;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          surahName,
          style: const TextStyle(fontSize: 24, fontFamily: 'Amiri'),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(
                  verses
                      .map((ayah) => '${ayah.text} ﴿${ayah.numberInSurah}﴾')
                      .join(' '),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'Amiri',
                    height: 2,
                    color: Color(0xFF4A148C),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
    );
  }
}
