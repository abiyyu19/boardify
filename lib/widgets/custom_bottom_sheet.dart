import 'package:boardify/providers/app_providers.dart';
import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/utils/constant.dart';
import 'package:boardify/widgets/custom_alert_dialog.dart';
import 'package:boardify/widgets/custom_textformfield.dart';
import 'package:boardify/widgets/selector_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_date_picker.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    this.visible,
    required this.nameController,
    this.onPressedButton,
    required this.dateController,
    required this.onTapDate,
    required this.listStatus,
    required this.firstValue,
    this.onChangedStatus,
    this.isIcon,
    this.projectId,
    this.onPressedAlertDialog,
  });

  final bool? visible;
  final TextEditingController nameController;
  final TextEditingController dateController;
  final Function()? onPressedButton;
  final Function() onTapDate;
  final void Function(String?)? onChangedStatus;
  final List<String> listStatus;
  final String firstValue;
  final bool? isIcon;
  final int? projectId;
  final Function()? onPressedAlertDialog;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: grayHehe,
            blurRadius: 8.0,
            spreadRadius: 4.0,
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Divider
            Divider(
              indent: MediaQuery.of(context).size.width * 0.2,
              endIndent: MediaQuery.of(context).size.width * 0.2,
              thickness: 2,
              color: Colors.black,
            ),

            miniGap,

            // Task Name and Delete Button
            nameAndDelete(context),

            Visibility(
              visible: visible == null ? true : false,
              child: const SizedBox(
                height: 5,
              ),
            ),

            // Task Nama Text Field
            CustomTextFormField(
              controller: nameController,
            ),
            miniGap,

            // Date Picker
            datePicker(context),

            miniGap,

            // Status picker
            statusPicker(context),
            miniGap,

            Consumer<AppProviders>(
              builder: (context, button, _) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    double.infinity,
                    MediaQuery.of(context).size.height * 0.06,
                  ),
                ),
                onPressed: onPressedButton,
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row datePicker(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Tenggat Waktu',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Flexible(
          child: CustomDatePicker(
            isIcon: isIcon,
            dateInputController: dateController,
            ontap: onTapDate,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.22,
        ),
      ],
    );
  }

  Row statusPicker(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Status',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.20,
        ),
        Flexible(
          child: SelectorFormField(
            onChanged: onChangedStatus,
            dropdownValue: firstValue,
            list: listStatus,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.22,
        ),
      ],
    );
  }

  Row nameAndDelete(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Nama Tugas',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Visibility(
          visible: visible ?? false,
          child: IconButton(
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
            ),
            color: Colors.red,
            alignment: Alignment.centerRight,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  content: 'Apakah Anda yakin ingin menghapus tugas ini?',
                  onPressed: onPressedAlertDialog,
                ),
              );
            },
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ),
      ],
    );
  }
}
