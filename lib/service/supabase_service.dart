import 'dart:convert';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/project.dart';
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

Future<bool> signUpEmailAndPassword(
    String email, String password, String name) async {
  try {
    final AuthResponse response = await client.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
        'email': email,
      },
    );

    final userId = response.user?.id;
    print(userId);
    print(response.user);

    if (userId != null) {
      return true;
    }
    if (userId == null) {
      throw const AuthException('Email sudah terdaftar');
    }

    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<void> signOut() async {
  await client.auth.signOut();
  return;
}

Future<List<dynamic>?> getProjectData() async {
  try {
    final data = await client
        .from('project')
        .select('*')
        .order('id_project', ascending: true);

    if (data != null) {
      // print(data[0]['deadline']);
      return data;
    }
    return null;
  } catch (e) {
    print(e.toString());
  }
  return null;
}
