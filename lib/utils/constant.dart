import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Supabase Client
final client = Supabase.instance.client;

final getIt = GetIt.instance;

abstract class Constants {
  static const String supabaseUrl = String.fromEnvironment(
    'https://foxthmkrsjgestkabrja.supabase.co',
    defaultValue: '',
  );

  static const String supabaseAnnonKey = String.fromEnvironment(
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZveHRobWtyc2pnZXN0a2FicmphIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODc0Mzc1MjEsImV4cCI6MjAwMzAxMzUyMX0.cFrUQJ7eJp5iTtEznHPsffo817assWF3_Ry8GY8ZPOo',
    defaultValue: '',
  );
}

// Colors
const mainBlue = Color(0xFF1DA1F2);
const grayUhuy = Color(0xFF919191);

// Small Gap
const smallGap = SizedBox(
  height: 15,
);

// Large Gap
const largeGap = SizedBox(
  height: 30,
);

// Custom Snack Bar
extension ShowSnackBar on BuildContext {
  void showErrorMessage(String messge) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          messge,
          style: const TextStyle(color: Colors.redAccent),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
