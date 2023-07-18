import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    this.backgroundColor,
  });

  final String text;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 2.0,
            color: Color(0xFF2B65F6),
          ),
          minimumSize: const Size.fromHeight(50),
          backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
