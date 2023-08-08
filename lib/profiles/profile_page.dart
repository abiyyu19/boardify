import 'package:flutter/material.dart';

import '../service/supabase_service.dart';
import '../utils/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Boardify",
          style: TextStyle(
            color: mainBlue,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: mainBlue,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Halaman Profil'),
            // Text( user ),
            ElevatedButton(
                onPressed: () {
                  signOut().then(
                      (value) => Navigator.pushReplacementNamed(context, '/'));
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
