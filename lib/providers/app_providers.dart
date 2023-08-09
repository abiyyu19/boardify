import 'package:flutter/foundation.dart';

class AppProviders with ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void changePageIndex(int value) {
    _pageIndex = value;
    print(_pageIndex);
    notifyListeners();
  }

  String? _categoryValue;
  String? _priorityValue;
  String? _dateInput;

  String? get categoryValue => _categoryValue;
  String? get priorityValue => _priorityValue;
  String? get dateInput => _dateInput;

  void changeCategoryValue(String value) {
    _categoryValue = value;
    print(value);
    notifyListeners();
  }

  void changePriorityValue(String value) {
    _priorityValue = value;
    print(value);
    notifyListeners();
  }

  void changeDateInput(String value) {
    _dateInput = value;
    print(value);
    notifyListeners();
  }
}
