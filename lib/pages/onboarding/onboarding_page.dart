import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'header_onboarding.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            largeGap,
            // Header
            const HeaderOnboarding(),
            largeGap,
            largeGap,
            smallGap,
            // Sign Up Button
            CustomButton(
              text: "Daftar",
              onPressed: () => {
                Navigator.pushNamed(context, '/signup'),
              },
              backgroundColor: mainBlue,
              textColor: Colors.white,
            ),
            smallGap,
            // Sign In Button
            CustomButton(
              text: "Masuk",
              onPressed: () => {
                Navigator.pushNamed(context, '/login'),
              },
              textColor: mainBlue,
            ),
          ],
        ),
      ),
    );
  }
}
