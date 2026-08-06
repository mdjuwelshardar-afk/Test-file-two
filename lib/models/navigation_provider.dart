import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (index >= 0 && index <= 4) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}
