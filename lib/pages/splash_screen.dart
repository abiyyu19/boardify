import 'package:boardify/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constant.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateHomeScreen();
  }

  _navigateHomeScreen() async {
    await Future.delayed(
        const Duration(milliseconds: 2000),
        () => Navigator.pushReplacementNamed(context,
            client.auth.currentSession != null ? '/homepage' : '/onboarding'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset('assets/boardify_logo.svg')),
    );
  }
}