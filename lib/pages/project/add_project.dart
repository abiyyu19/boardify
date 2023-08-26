import 'package:boardify/pages/project/handle_project.dart';
import 'package:boardify/pages/project/selector_field.dart';
import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/utils/constant.dart';
import 'package:boardify/widgets/custom_button.dart';
import 'package:boardify/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/app_providers.dart';
import '../../widgets/custom_alert_dialog.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String categoryValue = listCategory.first;
  String priorityValue = listPriority.first;
  String? dateValue;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    int? projectId = arguments['project_id'];
    bool? isEdit = arguments['is_edit'];
    setState(() {
      if (isEdit != null) {
        getOneProject(projectId).then((value) {
          _nameController.text = value?[0]['project_name'];
          _descriptionController.text = value?[0]['description'];

          categoryValue = value?[0]['category'];
          priorityValue = value?[0]['priority'];
          dateValue = value?[0]['deadline'];

          context.read<AppProviders>().changeCategoryValue(categoryValue);
          context.read<AppProviders>().changePriorityValue(priorityValue);
          context.read<AppProviders>().changeDateInput(dateValue);
        });
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            isEdit == true ? "Edit Proyek" : "Tambah Proyek",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Visibility(
              visible: isEdit ?? false,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      content: 'Apakah Anda yakin ingin menghapus Proyek ini?',
                      onPressed: () {
                        setState(
                          () {
                            deleteProject(projectId).then(
                              (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Berhasil Menghapus Proyek",
                                    ),
                                  ),
                                );
                                Navigator.pushNamed(context, '/mainpage');
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
        body: Consumer<AppProviders>(
          builder: (context, addProject, _) => Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              children: [
                smallGap,
                // Project Name
                CustomTextFormField(
                  label: 'Nama Proyek',
                  controller: _nameController,
                ),
                smallGap,
                // Project Description
                CustomTextFormField(
                  label: 'Deskripsi Proyek',
                  controller: _descriptionController,
                ),
                smallGap,
                // Selector Field for Category, Deadline, and Priority
                const SelectorField(),
                largeGap,
                // Add Button
                CustomButton(
                  text: 'OK',
                  textColor: Colors.white,
                  backgroundColor: mainBlue,
                  onPressed: (_nameController.text.isNotEmpty &&
                          _descriptionController.text.isNotEmpty)
                      ? () {
                          setState(() {
                            (isEdit != null)
                                ? handleEditProject(
                                    context,
                                    _nameController.text,
                                    _descriptionController.text,
                                    addProject.categoryValue,
                                    addProject.priorityValue,
                                    addProject.dateInput,
                                    projectId,
                                  )
                                : handleAddProject(
                                    context,
                                    _nameController.text,
                                    _descriptionController.text,
                                    addProject.categoryValue ?? categoryValue,
                                    addProject.priorityValue ?? priorityValue,
                                    addProject.dateInput ??
                                        DateFormat('yyyy-MM-dd')
                                            .format(DateTime.now())
                                            .toString(),
                                  );
                          });
                        }
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
