import 'package:fitness_tracking_app/model/service/helper/theme_helper.dart';
import 'package:flutter/material.dart';

class SettingViewModel with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  int _currentIndex = 0;
  bool _onPause = false;
  bool get onPause => _onPause;
  int get currentIndex => _currentIndex;
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

  void updateIndex(int index) {
    // if (_currentIndex != index) {
    //   _navigationHistory.add(index); // Add the new index to the navigation history
    //   _currentIndex = index;
    //   notifyListeners();
    //   debugPrint('Index Updated: $_currentIndex, History: $_navigationHistory');
    // }
    _currentIndex = index;
    notifyListeners();
  }

  void goBackToPreviousIndex() {
    // if (_navigationHistory.length > 1) {
    //   _navigationHistory.removeLast(); // Remove the current index
    //   _currentIndex = _navigationHistory.last; // Set the current index to the previous one
    //   notifyListeners();
    //   debugPrint('Went Back: $_currentIndex, History: $_navigationHistory');
    // }
    if (_currentIndex > 0) {
      _currentIndex = 0;
      notifyListeners();
    }
  }
  void togglePause() {
    _onPause = !_onPause;
    notifyListeners();
  }

}
