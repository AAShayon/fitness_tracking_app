import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final CarouselController _carouselController = CarouselController();
  int _currentPageIndex = 0;
  bool _onPause = false;

  CarouselController get carouselController => _carouselController;

  int get currentPageIndex => _currentPageIndex;

  bool get onPause => _onPause; // Getter for onPause

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


}