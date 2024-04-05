import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucheck/core/app_router.dart';
import 'package:ucheck/features/sign_in/views/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      routerConfig: Routes.router,
    );
  }
}
