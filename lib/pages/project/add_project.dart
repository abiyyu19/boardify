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
            builder: (context, value, _) => Form(
              onChanged: () => setState(() {}),
              key: _formKey,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                    onPressed: () {
                      const LoadingPage();
                      print(value.categoryValue);
                      print(value.priorityValue);
                      print(value.dateInput);

                      insertProjectData(
                        _nameController.text,
                        _descriptionController.text,
                        value.categoryValue,
                        value.priorityValue,
                        value.dateInput,
                      ).then(
                        (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Berhasil Menambahkan Proyek"),
                            ),
                          );
                          Navigator.pop(context);
                          // Navigator.pushNamedAndRemoveUntil(
                          //   context,
                          //   '/login',
                          //   ModalRoute.withName('/onboarding'),
                          // );
                          // Navigator.pushReplacementNamed(context, '/login');
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
