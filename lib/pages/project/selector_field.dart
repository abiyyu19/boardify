import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/app_providers.dart';

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
    return Consumer(
      builder: (context, value, _) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Category Dropdown
          selectorFormField(
            'Kategori',
            categoryValue,
            (String? value) {
              setState(() {
                categoryValue = value!;
                context.read<AppProviders>().changeCategoryValue(value);
              });
            },
            listCategory,
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
                TextFormField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    hintText: DateTime.now().toString(),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.1,
                      horizontal: 4,
                    ),
                    suffixIcon: _dateInput.text.isEmpty
                        ? Icon(
                            Icons.calendar_today,
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
                  controller: _dateInput,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
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
                    } else {}
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),

          // Priority Dropdown
          selectorFormField(
            'Prioritas',
            priorityValue,
            (String? value) {
              setState(() {
                priorityValue = value!;
                context.read<AppProviders>().changePriorityValue(value);
              });
            },
            listPriority,
          ),
        ],
      ),
    );
  }

  Flexible selectorFormField(
    String title,
    String dropdownValue,
    void Function(String?)? onChanged,
    List<String> list,
  ) {
    return Flexible(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          miniGap,
          DropdownButtonFormField(
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
                    color: grayUhuy,
                    fontSize: 12,
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
