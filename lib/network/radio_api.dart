import 'package:dio/dio.dart';

import '../model/radios_response.dart';

class RadioApi {
  final Dio _dio = Dio();

  Future<RadiosResponse> fetchRadios(String language) async {
    final currentLang = (language == 'en') ? 'eng' : 'ar';
    final response = await _dio
        .get("https://mp3quran.net/api/v3/radios?language=$currentLang");

    if (response.statusCode == 200) {
      return RadiosResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to load radios');
    }
  }
}
