import 'package:flutter/material.dart';

import '../utils/constant.dart';

class SelectorFormField extends StatelessWidget {
  const SelectorFormField({
    super.key,
    required this.dropdownValue,
    this.onChanged,
    required this.list,
  });

  final String dropdownValue;
  final void Function(String?)? onChanged;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 0.1,
          horizontal: 8,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: grayUhuy,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      elevation: 12,
      borderRadius: BorderRadius.circular(12),
      value: dropdownValue,
      onChanged: onChanged,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        );
      }).toList(),
    );
  }
}
