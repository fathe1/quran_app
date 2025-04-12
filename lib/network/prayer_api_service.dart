// TODO Implement this library.
// network/prayer_api_service.dart
import 'package:dio/dio.dart';
import '../model/prayer_times_model.dart';

class PrayerApiService {
  final Dio _dio = Dio();

  Future<PrayerTimes> fetchPrayerTimes() async {
    final response = await _dio.get(
      'https://api.aladhan.com/v1/timingsByCity',
      queryParameters: {
        'country': 'egypt',
        'city': 'cairo',
      },
    );

    if (response.statusCode == 200) {
      return PrayerTimes.fromJson(response.data);
    } else {
      throw Exception('فشل في جلب مواقيت الصلاة');
    }
  }
}
