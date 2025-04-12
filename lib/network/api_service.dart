import 'package:dio/dio.dart';
import '../model/surah_model.dart';
import '../model/ayah_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Surah>> fetchSurahs() async {
    final response = await _dio.get('https://api.alquran.cloud/v1/surah');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'];
      return data.map((json) => Surah.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load surahs');
    }
  }

  Future<List<Ayah>> fetchSurahVerses(int surahNumber) async {
    final response = await _dio
        .get('https://api.alquran.cloud/v1/surah/$surahNumber/quran-uthmani');
    if (response.statusCode == 200) {
      List<dynamic> verses = response.data['data']['ayahs'];
      return verses.map((ayahJson) => Ayah.fromJson(ayahJson)).toList();
    } else {
      throw Exception('Failed to load verses for surah $surahNumber');
    }
  }

  fetchSurahName(int surahNumber) {}
}
