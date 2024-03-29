import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.label,
    required this.controller,
    this.inputType,
    this.obsecureText,
    this.suffixIcon,
  });

  final String? label;
  final TextEditingController controller;
  final TextInputType? inputType;
  final bool? obsecureText;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Visibility(
            visible: label != null ? true : false,
            child: Text(
              label ?? 'Judul',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // Form
        TextFormField(
          obscureText: obsecureText ?? false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 12,
            ),
            enabledBorder: enabledBorder(),
            focusedBorder: focusedBorder(),
          ),
          keyboardType: inputType ?? TextInputType.text,
          controller: controller,
        ),
      ],
    );
  }

  OutlineInputBorder focusedBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: mainBlue,
        width: 1,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }

  OutlineInputBorder enabledBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: grayUhuy,
        width: 1,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }
}
