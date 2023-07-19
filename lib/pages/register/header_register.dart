import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constant.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        Center(
          child: SvgPicture.asset(
            'assets/svg/boardify_blue.svg',
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),

        largeGap,

        // Text
        const Text(
          "Ayo Mendaftar!",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 5,
        ),

        Text(
          "Kelola proyek dengan mudah bersama Boardify",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
