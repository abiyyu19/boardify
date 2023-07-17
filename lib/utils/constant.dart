import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Supabase Client
final client = Supabase.instance.client;

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
