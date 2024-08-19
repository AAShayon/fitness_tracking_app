import 'dart:convert';
import 'package:fitness_tracking_app/model/service/local/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService implements LocalStorageSystemService{
  static final LocalStorageService _singleton=LocalStorageService._internal();
   SharedPreferences? _sharedPreferences;

  factory LocalStorageService(){
    return _singleton;
  }
  LocalStorageService._internal();
  Future<SharedPreferences> _getInstance() async {
    return _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  @override
  Future<void> delete({required String key}) async {
    final prefs = await _getInstance();
    await prefs.remove(key);
  }

  @override
  Future<dynamic> read({required String key}) async{
    final prefs = await _getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> update({required String key, required value}) async{
    final prefs = await _getInstance();
    await delete(key: key);
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      await prefs.setString(key, jsonEncode(value));
    }
  }

  @override
  Future<void> write({required String key, required dynamic value}) async {
    final prefs = await _getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      await prefs.setString(key, jsonEncode(value));
    }
  }
}