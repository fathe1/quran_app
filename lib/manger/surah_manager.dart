// manager/surah_manager.dart
import 'package:flutter/material.dart';
import '../model/surah_model.dart';
import '../network/api_service.dart';

class SurahManager extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Surah> _surahs = [];
  bool _isLoading = false;

  List<Surah> get surahs => _surahs;
  bool get isLoading => _isLoading;

  Future<void> loadSurahs() async {
    _isLoading = true;
    notifyListeners();

    try {
      _surahs = await _apiService.fetchSurahs();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void fetchSurahs() {}
}
