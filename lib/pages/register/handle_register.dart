import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../service/supabase_service.dart';
import '../../widgets/loading_dialog.dart';

void handleRegister(BuildContext context, String nama, String email,
    String password, String confirmPassword) {
  if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password harus sama"),
      ),
    );
  } else if (password.length < 6 && confirmPassword.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password harus terdiri dari 6 karakter"),
      ),
    );
  } else {
    loadingWidget(context);
    signUpEmailAndPassword(email, password, nama).then(
      (value) async {
        if (value) {
          // await client.from('users').insert({
          //   'name': nama,
          // });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Register Berhasil"),
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', ModalRoute.withName('/onboarding'));
          // Navigator.pushReplacementNamed(context, '/login');
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email Sudah digunakan"),
            ),
          );
        }
      },
    );
  }
}
