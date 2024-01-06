import 'package:boardify/providers/app_providers.dart';
import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../service/supabase_service.dart';
import '../../widgets/loading_page.dart';

void handleEditProject(
  BuildContext context,
  String name,
  String? desc,
  String? category,
  String? priority,
  String? deadline,
  int? projectId,
) {
  const LoadingPage();
  editProject(
    name,
    desc,
    category,
    deadline,
    priority,
    projectId,
  ).then((value) {
    context.read<AppProviders>().changeCategoryValue(listCategory.first);
    context.read<AppProviders>().changePriorityValue(listPriority.first);

    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    context.read<AppProviders>().changeDateInput(formattedDate);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Berhasil Mengubah Proyek"),
      ),
    );
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/projectdetail',
      ModalRoute.withName('/mainpage'),
      arguments: {'project_id': projectId},
    );
  });
}

void handleAddProject(
  BuildContext context,
  String name,
  String? desc,
  String? category,
  String? priority,
  String? deadline,
) {
  const LoadingPage();
  insertProjectData(
    name,
    desc,
    category,
    priority,
    deadline,
  ).then(
    (value) {
      context.read<AppProviders>().changeCategoryValue(listCategory.first);
      context.read<AppProviders>().changePriorityValue(listPriority.first);

      String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      context.read<AppProviders>().changeDateInput(formattedDate);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Berhasil Menambahkan Proyek"),
        ),
      );
      getProjectData();
      Navigator.pop(context);
      // Navigator.pushNamedAndRemoveUntil(
      //     context, '/mainpage', ModalRoute.withName('/onboarding'));
      // Navigator.pushNamed(context, '/mainpage');
    },
  );
}
