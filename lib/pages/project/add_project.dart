import 'package:boardify/pages/project/selector_field.dart';
import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/utils/constant.dart';
import 'package:boardify/widgets/custom_button.dart';
import 'package:boardify/widgets/custom_textformfield.dart';
import 'package:boardify/widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_providers.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text(
            "Tambah Proyek",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Consumer<AppProviders>(
          builder: (context, addProject, _) => Form(
            onChanged: () => setState(() {}),
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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

                const SelectorField(),

                largeGap,

                CustomButton(
                  text: 'OK',
                  textColor: Colors.white,
                  backgroundColor: mainBlue,
                  onPressed: (_nameController.text.isNotEmpty &&
                          _descriptionController.text.isNotEmpty)
                      ? () {
                          const LoadingPage();
                          insertProjectData(
                            _nameController.text,
                            _descriptionController.text,
                            addProject.categoryValue,
                            addProject.priorityValue,
                            addProject.dateInput,
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
