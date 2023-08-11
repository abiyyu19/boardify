import 'package:flutter/material.dart';

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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Berhasil Mengubah Proyek"),
      ),
    );
    Navigator.pop(context);
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Berhasil Menambahkan Proyek"),
        ),
      );
      Navigator.pop(context);
    },
  );
}
