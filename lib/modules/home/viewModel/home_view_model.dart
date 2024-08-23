import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final CarouselController _carouselController = CarouselController();
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


}