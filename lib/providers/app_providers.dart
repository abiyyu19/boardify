import 'package:flutter/foundation.dart';

class AppProviders with ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void changePageIndex(int value) {
    _pageIndex = value;
    print(_pageIndex);
    notifyListeners();
  }

  // Add Task Value

  String? _categoryValue;
  String? _priorityValue;
  String? _dateInput;
  String? _statusValue;

  String? get categoryValue => _categoryValue;
  String? get priorityValue => _priorityValue;
  String? get dateInput => _dateInput;
  String? get statusValue => _statusValue;

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

  void changeDateInput(String? value) {
    _dateInput = value;
    print(value);
    notifyListeners();
  }

  void changeStatusValue(String value) {
    _statusValue = value;
    print(value);
    notifyListeners();
  }

  // Project ID

  int? _projectId;

  int? get projectId => _projectId;

  void changeProjectId(int id) {
    _projectId = id;
    // print(projectId);
    notifyListeners();
  }
}
