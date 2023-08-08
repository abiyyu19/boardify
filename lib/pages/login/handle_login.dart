import 'package:flutter/material.dart';

import '../../service/supabase_service.dart';
import '../../widgets/loading_dialog.dart';

void handleLogin(BuildContext context, String email, String password) {
  if (password.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password harus terdiri dari 6 karakter"),
      ),
    );
  } else {
    loadingWidget(context);
    signInEmailAndPassword(email, password).then(
      (value) {
        if (value) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login berhasil"),
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
              context, '/mainpage', ModalRoute.withName('/mainpage'));
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email/Password Salah"),
            ),
          );
        }
      },
    );
  }
}
