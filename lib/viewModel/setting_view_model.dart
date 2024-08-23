import 'package:fitness_tracking_app/model/service/helper/theme_helper.dart';
import 'package:flutter/material.dart';

class SettingViewModel with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  final ThemeService _themeService = ThemeService();

  SettingViewModel() {
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



}
