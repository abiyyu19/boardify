import 'package:boardify/pages/main_page.dart';
import 'package:boardify/pages/onboarding/onboarding_page.dart';
import 'package:boardify/pages/login/login_page.dart';
import 'package:boardify/pages/project/add_project.dart';
import 'package:boardify/pages/project/project_detail.dart';
import 'package:boardify/pages/register/register_page.dart';
import 'package:boardify/pages/splash_screen.dart';
import 'package:boardify/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Supabase Initialize
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
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: ChangeNotifierProvider(
        create: (context) => AppProviders(),
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Boardify',
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreenPage(),
            '/onboarding': (context) => const OnBoardingPage(),
            '/mainpage': (context) => MainPage(),
            '/login': (context) => const LoginPage(),
            '/signup': (context) => const RegisterPage(),
            '/addproject': (context) => const AddProject(),
            '/projectdetail': (context) => const ProjectDetail(),
          },
        ),
      ),
    );
  }
}
