import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    this.onPressed,
    this.backgroundColor,
  });

  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        disabledForegroundColor: Colors.grey,
        side: BorderSide(
          width: 1.0,
          color: onPressed != null ? mainBlue : Colors.grey,
        ),
        minimumSize: const Size.fromHeight(50),
        backgroundColor: backgroundColor,
        disabledBackgroundColor: Colors.grey,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
