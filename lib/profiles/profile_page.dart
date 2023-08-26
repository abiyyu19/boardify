import 'dart:developer';
import 'package:boardify/profiles/profile_content.dart';
import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../service/supabase_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final User? user = client.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    log(user?.userMetadata?["name"]);
    log('${user?.id}');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PROFIL",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () {
              signOut().then(
                (value) => Navigator.pushReplacementNamed(context, '/'),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: mainBlue,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
        child: Column(
          children: [
            // Avatar Section
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.2,
              backgroundColor: Colors.transparent,
              child: Icon(
                size: MediaQuery.of(context).size.width * 0.4,
                Icons.person,
                color: Colors.black,
              ),
            ),
            const Text('Semua Informasi mengenai data diri dan akun'),
            smallGap,
            // Nama Section
            ProfileContent(
              title: 'Nama',
              information: user?.userMetadata?['name'],
            ),
            // Email Section
            ProfileContent(
              title: 'Email',
              information: user?.userMetadata?['email'],
            ),
            // Password Section
            const ProfileContent(
              title: 'Password',
            ),
            // Edit Button
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: Text(
                'Edit',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
              ),
            )
          ],
        ),
      ),
    );
  }
}
