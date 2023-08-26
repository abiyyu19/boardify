import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    super.key,
    required this.title,
    this.information,
  });

  final String title;
  final String? information;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            (information != null)
                ? Text(
                    information!,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: grayHehe,
                      ),
                    ),
                  )
                : SvgPicture.asset('assets/svg/password_hidden.svg'),
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
        smallGap,
      ],
    );
  }
}
