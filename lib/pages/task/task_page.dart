import 'package:boardify/pages/task/doing_page.dart';
import 'package:boardify/pages/task/waiting_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constant.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "TUGAS",
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
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              // Tab Bar
              TabBar(
                indicatorPadding: const EdgeInsets.all(8),
                unselectedLabelColor: grayUhuy,
                labelColor: mainBlue,
                labelStyle: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                tabs: const [
                  Tab(
                    text: 'Belum Dikerjakan',
                  ),
                  Tab(
                    text: 'Dikerjakan',
                  )
                ],
              ),
              // Tab Bar View
              const Expanded(
                child: TabBarView(
                  children: [
                    WaitingPage(),
                    DoingPage(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
