import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  PageController get pageController => _pageController;

  int get currentPageIndex => _currentPageIndex;

  void updatePageIndicator(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  void dotNavigationClick(int index) {
    _currentPageIndex = index;
    pageController.jumpTo(index.toDouble());
    notifyListeners();
  }


}