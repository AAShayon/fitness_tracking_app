import 'package:fitness_tracking_app/model/service/helper/theme_helper.dart';
import 'package:flutter/material.dart';

class LandingViewModel with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  final ThemeService _themeService = ThemeService();

  LandingViewModel() {
    _initializeThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  Future _initializeThemeMode() async {
    ThemeMode storedThemeMode = await _themeService.getThemeMode();
    if (storedThemeMode != null) {
      _themeMode = storedThemeMode;
      notifyListeners();
    }
  }

  Future setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _themeService.saveThemeMode(mode);
    notifyListeners();
  }

  Future updateThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _themeService.updateThemeMode(mode);
    notifyListeners();
  }

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void goBackToPreviousIndex() {
    if (_currentIndex > 0) {
      _currentIndex = 0; // Resetting to the first index
      notifyListeners();
    }
  }
}
