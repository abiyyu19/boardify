import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    this.inputType,
    this.obsecureText,
    this.suffixIcon,
  });

  final String label;
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
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Form
        TextFormField(
          minLines: 1,
          maxLines: 5,
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
          style: const TextStyle(fontFamily: 'OpenSans'),
        ),
      ],
    );
  }

  OutlineInputBorder focusedBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: mainBlue,
        width: 0.5,
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
        width: 0.5,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }
}
