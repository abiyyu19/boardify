import 'package:boardify/utils/constant.dart';
import 'package:boardify/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/app_providers.dart';
import '../../widgets/selector_form_field.dart';

class SelectorField extends StatefulWidget {
  const SelectorField({super.key});

  @override
  State<SelectorField> createState() => _SelectorFieldState();
}

class _SelectorFieldState extends State<SelectorField> {
  String categoryValue = listCategory.first;
  String priorityValue = listPriority.first;
  final TextEditingController _dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProviders>(
      builder: (context, project, _) {
        // if (project.dateInput != null) {
        //   _dateInput.text = project.dateInput!;
        // }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Category Dropdown
            Flexible(
              child: Column(
                children: [
                  const Text(
                    'Prioritas',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  miniGap,
                  SelectorFormField(
                    dropdownValue: project.categoryValue ?? categoryValue,
                    list: listCategory,
                    onChanged: (String? value) {
                      categoryValue = value!;
                      context.read<AppProviders>().changeCategoryValue(value);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(
              width: 5,
            ),

            // Date Picker for Deadline
            Flexible(
              child: Column(
                children: [
                  const Text(
                    'Tenggat Waktu',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  miniGap,
                  CustomDatePicker(
                    dateInputController: _dateInput,
                    ontap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.parse(project.dateInput!) ??
                              DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          _dateInput.text =
                              formattedDate; //set output date to TextField value.
                          context
                              .read<AppProviders>()
                              .changeDateInput(_dateInput.text);
                        });
                      } else {
                        print('hehe');
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),

            // Priority Dropdown
            Flexible(
              child: Column(
                children: [
                  const Text(
                    'Prioritas',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  miniGap,
                  SelectorFormField(
                    dropdownValue: project.priorityValue ?? priorityValue,
                    list: listPriority,
                    onChanged: (String? value) {
                      priorityValue = value!;
                      context.read<AppProviders>().changePriorityValue(value);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
