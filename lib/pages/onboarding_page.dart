import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              SvgPicture.asset('assets/boardify_logo.svg'),
              // Image
              SvgPicture.asset(
                'assets/people_with_board.svg',
                height: 300,
              ),
              // Text
              const Text(
                "Unlocking Success Through\nEffective Project\nManagement",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              largeGap,
              // Sign Up Button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color(0xFF2B65F6)),
                onPressed: () => {
                  Navigator.pushNamed(context, '/signup'),
                },
                child: const Text(
                  "DAFTAR",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              smallGap,

              // Sign In Button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  side: const BorderSide(width: 2.0, color: Color(0xFF2B65F6)),
                ),
                onPressed: () => {
                  Navigator.pushNamed(context, '/signin'),
                },
                child: const Text(
                  "MASUK",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
