import 'package:flutter/material.dart';
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
    print(client.auth.currentSession?.user);
    print(client.auth.currentSession);
    await Future.delayed(
      const Duration(milliseconds: 2000),
      () => Navigator.pushReplacementNamed(context,
          client.auth.currentSession != null ? '/homepage' : '/onboarding'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset('assets/svg/boardify_logo.svg')),
    );
  }
}
