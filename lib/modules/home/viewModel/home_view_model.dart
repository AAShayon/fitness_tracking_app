import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  bool _onPause = false;

  PageController get pageController => _pageController;

  int get currentPageIndex => _currentPageIndex;

  bool get onPause => _onPause; // Getter for onPause

  void updatePageIndicator(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  void dotNavigationClick(int index) {
    _currentPageIndex = index;
    pageController.jumpTo(index.toDouble());
    notifyListeners();
  }
  void togglePause() {
    _onPause = !_onPause;
    notifyListeners();
  }


}