import 'dart:developer';

import 'package:boardify/pages/project/handle_task.dart';
import 'package:boardify/pages/project/project_detail_header.dart';
import 'package:boardify/providers/app_providers.dart';
import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/utils/constant.dart';
import 'package:boardify/widgets/custom_button.dart';
import 'package:boardify/widgets/loading_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_bottom_sheet.dart';
import '../../widgets/task_card.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({
    super.key,
  });

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String statusValue = listStatus.first;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    int projectId = arguments['project_id'];

    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data
        setState(() {
          Navigator.pop(context);
        });

        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text(
            "Detail Proyek",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/addproject',
                  arguments: {
                    'project_id': projectId,
                    'is_edit': true,
                  },
                ).then((value) => setState(() {}));
              },
              icon: const Icon(Icons.edit),
            )
          ],
        ),
        body: FutureBuilder(
          future: getOneProject(projectId),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                children: [
                  // Project Detail Header
                  ProjectDetailHeader(snapshot: snapshot),
                  smallGap,
                  // Task Title
                  const Text(
                    'Tugas',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Task List
                  FutureBuilder(
                    future: getTask(projectId),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        // Condition if There's No Data
                        if (snapshot.data.length == 0) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.05,
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
                          // List View Builder if There's Any Data
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              // Consumer for Provider State Management
                              return Consumer<AppProviders>(
                                builder: (context, editTask, _) => TaskCard(
                                  title: snapshot.data[index]['task_name'],
                                  deadline: DateFormat.yMMMMd().format(
                                    DateTime.parse(
                                      snapshot.data[index]['deadline'],
                                    ),
                                  ),
                                  status: snapshot.data[index]['status'],
                                  onPressed: () {
                                    // onPressed Method for Each Data
                                    log('xixixi ${snapshot.data[index]['id_task']}');
                                    getOneTask(snapshot.data[index]['id_task'])
                                        .then(
                                      (value) {
                                        _nameController.text =
                                            value?[0]['task_name'];
                                        _dateController.text =
                                            value?[0]['deadline'];
                                        // Show Bottom Sheet for Edit Task
                                        showBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              CustomBottomSheet(
                                            projectId: projectId,
                                            visible: true,
                                            nameController: _nameController,
                                            dateController: _dateController,
                                            onTapDate: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.parse(
                                                  value?[0]['deadline'],
                                                ),
                                                firstDate: DateTime(1950),
                                                //DateTime.now() - not to allow to choose before today.
                                                lastDate: DateTime(2100),
                                              );

                                              if (pickedDate != null) {
                                                String formattedDate =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(pickedDate);

                                                _dateController.text =
                                                    formattedDate;
                                              } else {
                                                print('hehe');
                                              }
                                            },
                                            listStatus: listStatus,
                                            firstValue: value?[0]['status'],
                                            onPressedAlertDialog: () {
                                              setState(
                                                () {
                                                  deleteTask(
                                                          value?[0]['id_task'])
                                                      .then(
                                                    (value) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                            "Berhasil Menghapus Tugas",
                                                          ),
                                                        ),
                                                      );
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                            onPressedButton: () {
                                              setState(
                                                () {
                                                  handleEditTask(
                                                    context,
                                                    _nameController.text,
                                                    _dateController.text,
                                                    editTask.statusValue ??
                                                        statusValue,
                                                    projectId,
                                                    value?[0]['id_task'],
                                                  );
                                                },
                                              );
                                              _nameController.clear();
                                              _dateController.clear();
                                              statusValue = listStatus.first;
                                            },
                                            onChangedStatus: (String? value) {
                                              statusValue = value!;
                                              context
                                                  .read<AppProviders>()
                                                  .changeStatusValue(value);
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        }
                        // Condition if Future Method didn't Return Anything
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
                  miniGap,
                  // Add Task Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(4),
                      dashPattern: const [5, 5],
                      color: Colors.black,
                      strokeWidth: 2,
                      child: SizedBox(
                        height: 35,
                        child: Consumer<AppProviders>(
                          builder: (context, addTask, _) => CustomButton(
                            text: 'Tambah Tugas',
                            textColor: Colors.black,
                            borderSide: false,
                            onPressed: () {
                              _dateController.clear();
                              _nameController.clear();
                              // Show Bottom Sheet for Add Task
                              showBottomSheet(
                                context: context,
                                builder: (context) => CustomBottomSheet(
                                  isIcon: false,
                                  onChangedStatus: (String? value) {
                                    statusValue = value!;
                                    context
                                        .read<AppProviders>()
                                        .changeStatusValue(value);
                                  },
                                  firstValue: statusValue,
                                  listStatus: listStatus,
                                  dateController: _dateController,
                                  nameController: _nameController,
                                  onPressedButton: () {
                                    //onPressed Method for Add Task
                                    setState(() {
                                      handleAddTask(
                                        context,
                                        _nameController.text,
                                        _dateController.text,
                                        addTask.statusValue ?? statusValue,
                                        projectId,
                                      );
                                    });
                                    _nameController.clear();
                                    _dateController.clear();
                                    statusValue = listStatus.first;
                                  },
                                  onTapDate: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2100));

                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);

                                      _dateController.text = formattedDate;
                                    } else {
                                      log('hehe');
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
              // Condition if Data Hasn't Not Loaded
            } else {
              return const Center(
                child: LoadingPage(),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}
