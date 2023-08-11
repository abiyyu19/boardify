import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.content,
    this.onPressed,
  });

  final String content;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tolong Konfirmasi'),
      content: Text(content),
      actions: [
        // The "Yes" button
        TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.of(context).pop();
            },
            child: const Text('NO')),
        TextButton(
          onPressed: onPressed,
          child: const Text('YES'),
        )
      ],
    );
  }
}
