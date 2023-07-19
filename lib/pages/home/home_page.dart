import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Session? session = client.auth.currentSession;

  final User? user = client.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(session!.expiresIn.toString()),
          // Text( user ),
          ElevatedButton(
              onPressed: () {
                signOut().then(
                    (value) => Navigator.pushReplacementNamed(context, '/'));
              },
              child: Text('Logout')),
        ],
      )),
    );
  }
}
