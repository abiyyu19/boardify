import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

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
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Halaman Proyek',
        ),
      ),
    );
  }
}
