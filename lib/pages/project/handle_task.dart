import 'package:flutter/material.dart';

import '../../service/supabase_service.dart';
import '../../widgets/loading_page.dart';

void handleAddTask(BuildContext context, String name, String date,
    String? status, int projectId) {
  const LoadingPage();
  insertNewTask(
    name,
    date,
    status,
    projectId,
  ).then(
    (value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Berhasil Menambahkan Tugas",
          ),
        ),
      );
      Navigator.pop(context);
    },
  );
}

void handleEditTask(BuildContext context, String name, String date,
    String? status, int projectId) {
  const LoadingPage();
  insertNewTask(
    name,
    date,
    status,
    projectId,
  ).then(
    (value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Berhasil Menambahkan Tugas",
          ),
        ),
      );
      Navigator.pop(context);
    },
  );
}
