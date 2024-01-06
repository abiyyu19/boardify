import 'dart:developer';

import 'package:boardify/pages/home/header_home_page.dart';
import 'package:boardify/pages/home/project_list.dart';
import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Session? session = client.auth.currentSession;

  final User? user = client.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    log(user?.userMetadata?["name"]);
    log('${user?.id}');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          primary: false,
          title: Text(
            'Boardify',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: mainBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          children: [
            // Home Page Header
            HeaderHomePage(
              user: user,
            ),
            // Your Project
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'Proyek Kamu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            // Gap between Your Project and Project List
            const SizedBox(
              height: 5,
            ),
            // Project Listt
            ProjectList(
              user: user,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/addproject')
              .then((_) => setState(() {})),
          backgroundColor: mainBlue,
          elevation: 4,
          child: const Icon(CupertinoIcons.add),
        ),
      ),
    );
  }
}
