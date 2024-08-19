import 'package:fitness_tracking_app/model/service/helper/theme_helper.dart';
import 'package:flutter/material.dart';

class LandingViewModel with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  final ThemeService _themeService = ThemeService();
  LandingViewModel() {
    _initializeThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  Future<void> _initializeThemeMode() async {
    ThemeMode storedThemeMode = await _themeService.getThemeMode();
    _themeMode = storedThemeMode;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _themeService.saveThemeMode(mode);
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _themeService.updateThemeMode(mode);
    notifyListeners();
  }
  ///checking git status commit
}