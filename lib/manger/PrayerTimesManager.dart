// manager/prayer_times_manager.dart
import 'package:flutter/material.dart';
import '../model/prayer_times_model.dart';
import '../network/prayer_api_service.dart';

class PrayerTimesManager extends ChangeNotifier {
  final PrayerApiService _apiService = PrayerApiService();
  PrayerTimes? _prayerTimes;
  bool _isLoading = true;

  PrayerTimes? get prayerTimes => _prayerTimes;
  bool get isLoading => _isLoading;

  Future<void> fetchPrayerTimes() async {
    try {
      _prayerTimes = await _apiService.fetchPrayerTimes();
    } catch (e) {
      _prayerTimes = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
