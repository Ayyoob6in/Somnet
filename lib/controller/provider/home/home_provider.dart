import 'package:flutter/material.dart';

class HomeState with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setPage(int page) {
    if (_currentPage != page) {
      _currentPage = page;
      notifyListeners();
    }
  }
}
