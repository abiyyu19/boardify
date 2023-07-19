import 'package:boardify/utils/constant.dart';
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
        SvgPicture.asset(
          'assets/svg/boardify_blue.svg',
          width: MediaQuery.of(context).size.width * 0.3,
        ),

        // Image
        SvgPicture.asset(
          'assets/svg/people_with_board.svg',
          height: 300,
        ),

        smallGap,

        // Text
        const Text(
          "Unlocking Success Through\nEffective Project\nManagement",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
