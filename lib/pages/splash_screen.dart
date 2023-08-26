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
    super.initState();
    _navigateHomeScreen();
  }

  _navigateHomeScreen() async {
    await Future.delayed(
      const Duration(milliseconds: 2000),
      () => Navigator.pushReplacementNamed(context,
          client.auth.currentSession != null ? '/mainpage' : '/onboarding'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: mainBlue,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: mainBlue,
        body: Center(child: SvgPicture.asset('assets/svg/boardify_white.svg')),
      ),
    );
  }
}
