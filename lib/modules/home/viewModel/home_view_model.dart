import 'dart:convert';
import 'dart:io';

import 'package:fitness_tracking_app/model/service/helper/local_storage_helper.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final LocalStorageService _storageService = LocalStorageService();
  final CarouselController _carouselController = CarouselController();
  String? name;
  String? profileImage;
  int _currentPageIndex = 0;
  int _currentIndex = 0;
  bool _onPause = false;
  bool get onPause => _onPause;
  int get currentIndex => _currentIndex;

  CarouselController get carouselController => _carouselController;

  int get currentPageIndex => _currentPageIndex;

  void updatePageIndicator(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  void dotNavigationClick(int index) {
    _currentPageIndex = index;
    carouselController.jumpTo(index.toDouble());
    notifyListeners();
  }
  void togglePause() {
    _onPause = !_onPause;
    notifyListeners();
  }
  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void goBackToPreviousIndex() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  Future<void> login({
    required String name,
    required File? profileImage,
  }) async {
    await _storageService.write(key: 'name', value: name);
    if (profileImage != null) {
      await _storageService.write(key: 'profileImage', value: base64Encode(profileImage.readAsBytesSync()));
    }
    await _loadUserData();
    notifyListeners();
  }

  Future<void> logout() async {
    await _storageService.delete(key: 'name');
    await _storageService.delete(key: 'profileImage');
    name = null;
    profileImage = null;
    notifyListeners();
  }

  Future<bool> isLoggedIn() async {
    await _loadUserData();
    return name != null;
  }

  Future<void> _loadUserData() async {
    name = await _storageService.read(key: 'name') as String?;
    profileImage = await _storageService.read(key: 'profileImage') as String?;
  }
}