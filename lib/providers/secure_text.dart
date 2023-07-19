import 'package:flutter/foundation.dart';

class SecureText with ChangeNotifier {
  bool _secureText = true;

  bool get secureText => _secureText;

  void changeSecureText() {
    _secureText = !_secureText;
    notifyListeners();
  }
}
