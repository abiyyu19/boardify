import 'package:flutter/foundation.dart';

class AppProviders with ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void changePageIndex(int value) {
    _pageIndex = value;
    print(_pageIndex);
    notifyListeners();
  }
}
