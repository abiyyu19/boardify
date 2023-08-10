import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/utils/constant.dart';
import 'package:boardify/widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_providers.dart';
import '../../widgets/project_card.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  void initState() {
    super.initState();
    getProjectData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProjectData(),
      builder: (context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length == 0) {
            return Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: const Center(
                child: Text(
                  'Anda Belum Memiliki Proyek',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: grayUhuy,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          } else {
            return Consumer(
              builder: (context, projectDetail, _) => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => ProjectCard(
                  category: snapshot.data[index]['category'],
                  title: snapshot.data[index]['project_name'],
                  deadline: DateTime.parse(snapshot.data[index]['deadline']),
                  priority: snapshot.data[index]['priority'],
                  taskDone: 8,
                  totalTask: 10,
                  onPressed: () {
                    context
                        .read<AppProviders>()
                        .changeProjectId(snapshot.data[index]['id_project']);
                    Navigator.pushNamed(
                      context,
                      '/projectdetail',
                      arguments: {
                        'project_id': snapshot.data[index]['id_project']
                      },
                    );
                  },
                ),
              ),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            child: const LoadingPage(),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: const Center(
              child: Text(
                'Anda Belum Memiliki Proyek',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: grayUhuy,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
