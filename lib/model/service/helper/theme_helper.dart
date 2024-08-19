import 'package:fitness_tracking_app/model/service/local/theme.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracking_app/model/service/helper/local_storage_helper.dart';

class ThemeService implements ThemeSystemService {
  static final ThemeService _singleton = ThemeService._internal();
  late final LocalStorageService _localStorageService;

  factory ThemeService() {
    return _singleton;
  }

  ThemeService._internal() {
    _localStorageService = LocalStorageService();
  }

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    await _localStorageService.write(key: 'themeMode', value: _themeModeToString(mode));
  }

  @override
  Future<ThemeMode> getThemeMode() async {
    String? storedThemeMode = await _localStorageService.read(key: 'themeMode');
    return _stringToThemeMode(storedThemeMode ?? 'system');
  }

  @override
  Future<void> updateThemeMode(ThemeMode mode) async {
    await _localStorageService.update(key: 'themeMode', value: _themeModeToString(mode));
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.system:
        return 'system';
    }
  }

  ThemeMode _stringToThemeMode(String mode) {
    switch (mode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}
