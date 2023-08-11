import 'package:boardify/service/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/app_providers.dart';
import '../../utils/constant.dart';
import '../../widgets/loading_page.dart';
import '../../widgets/task_card.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder(
          future: getAllTask(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.length == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: const Center(
                    child: Text(
                      'Anda Belum Memiliki Tugas',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: grayUhuy,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Consumer<AppProviders>(
                      builder: (context, editTask, _) => TaskCard(
                        projectName: snapshot.data[index]['project']
                            ['project_name'],
                        title: snapshot.data[index]['task_name'],
                        deadline: DateFormat.yMMMMd().format(
                          DateTime.parse(
                            snapshot.data[index]['deadline'],
                          ),
                        ),
                        status: snapshot.data[index]['status'],
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/projectdetail',
                            arguments: {
                              'project_id': snapshot.data[index]['id_project']
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              }
            } else {
              return Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                ),
                child: const LoadingPage(),
              );
            }
          },
        ),
      ),
    );
  }
}
