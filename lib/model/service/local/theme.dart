
import 'package:flutter/material.dart';

abstract class ThemeSystemService {
  Future<void> saveThemeMode(ThemeMode mode);
  Future<ThemeMode> getThemeMode();
  Future<void> updateThemeMode(ThemeMode mode);
}