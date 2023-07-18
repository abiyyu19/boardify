import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderOnboarding extends StatelessWidget {
  const HeaderOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon
        SvgPicture.asset('assets/svg/boardify_logo.svg'),

        // Image
        SvgPicture.asset(
          'assets/svg/people_with_board.svg',
          height: 300,
        ),

        // Text
        const Text(
          "Unlocking Success Through\nEffective Project\nManagement",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
