import 'package:boardify/pages/home/header_home_page.dart';
import 'package:boardify/pages/home/project_list.dart';
import 'package:boardify/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Session? session = client.auth.currentSession;

  final User? user = client.auth.currentUser;
  @override
  Widget build(BuildContext context) {
    print(user?.userMetadata?["name"]);
    print(user?.id);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          primary: false,
          title: const Text(
            'Boardify',
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
              icon: const Icon(Icons.notifications),
              color: mainBlue,
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            // Home Page Header
            HeaderHomePage(
              user: user,
            ),

            // Your Project
            const Text(
              'Proyek Kamu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            const ProjectList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/addproject'),
          backgroundColor: mainBlue,
          elevation: 4,
          child: const Icon(CupertinoIcons.add),
        ),
      ),
    );
  }
}
