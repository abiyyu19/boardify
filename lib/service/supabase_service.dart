import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/constant.dart';

Future<bool> signInEmailAndPassword(String email, String password) async {
  try {
    final AuthResponse response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final userId = response.user?.id;

    if (userId != null) {
      return true;
    }

    if (userId == null) {
      throw const AuthException('Email/Password Salah');
    }

    print(response.session);
    print(response.user);

    return false;
  } catch (e) {
    return false;
  }
}

Future<String> signUpEmailAndPassword(String email, String password) async {
  final AuthResponse response = await client.auth.signUp(
    email: email,
    password: password,
  );

  final userId = response.user?.id;
  if (userId == null) {
    throw UnimplementedError();
  }

  return userId;
}

Future<void> signOut() async {
  await client.auth.signOut();
  return;
}
