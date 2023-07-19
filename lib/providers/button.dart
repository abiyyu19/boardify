import 'package:flutter/foundation.dart';

class Button with ChangeNotifier {
  String? _email;
  String? _password;

  String? get email => _email;
  String? get passsword => _password;

  void changeSecureText() {
    // _secureText = !_secureText;
    notifyListeners();
  }
}
