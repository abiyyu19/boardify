import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/app_providers.dart';
import '../../service/supabase_service.dart';
import '../../utils/constant.dart';
import '../../widgets/loading_page.dart';
import '../../widgets/task_card.dart';

class WaitingPage extends StatefulWidget {
  const WaitingPage({super.key});

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllTaskWaiting(),
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
    );
  }
}
