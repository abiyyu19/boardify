import 'package:boardify/pages/home_page.dart';
import 'package:boardify/pages/onboarding_page.dart';
import 'package:boardify/pages/signin_page.dart';
import 'package:boardify/pages/signup_page.dart';
import 'package:boardify/pages/splash_screen.dart';
import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://foxthmkrsjgestkabrja.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZveHRobWtyc2pnZXN0a2FicmphIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODc0Mzc1MjEsImV4cCI6MjAwMzAxMzUyMX0.cFrUQJ7eJp5iTtEznHPsffo817assWF3_Ry8GY8ZPOo',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white38,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        theme: ThemeData(
          textTheme:
              GoogleFonts.lexendZettaTextTheme(Theme.of(context).textTheme),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Boardify',
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreenPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/homepage': (context) => const HomePage(),
          '/signin': (context) => const SignInPage(),
          '/signup': (context) => const SignUpPage(),
        },
      ),
    );
  }
}
