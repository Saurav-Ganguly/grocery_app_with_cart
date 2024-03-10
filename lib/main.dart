import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/models/cart.dart';
import 'package:grocery_app/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          shape: CircleBorder(),
          foregroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.notoSerif().copyWith(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.notoSerif().copyWith(
            fontSize: 16,
          ),
        ),
      ),
      home: const IntroPage(),
    );
  }
}
