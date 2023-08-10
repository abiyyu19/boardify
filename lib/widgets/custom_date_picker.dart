import 'package:boardify/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../utils/constant.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.dateInputController,
    required this.ontap,
    this.isIcon,
  });

  final TextEditingController dateInputController;
  final Function() ontap;
  final bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProviders>(
      builder: (context, value, _) => TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          hintText: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0.1,
            horizontal: 4,
          ),
          suffixIcon: isIcon != null
              ? null
              : dateInputController.text.isEmpty
                  ? Icon(
                      Icons.calendar_month,
                      size: MediaQuery.of(context).size.width * 0.05,
                    )
                  : null,
          labelStyle: const TextStyle(
            fontSize: 12,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: grayUhuy,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        readOnly: true,
        controller: dateInputController,
        onTap: ontap,
      ),
    );
  }
}
