

import 'package:brandie/constants.dart';
import 'package:brandie/pages/content_page.dart';
import 'package:brandie/pages/home_page.dart';
import 'package:brandie/widgets/sales_popup.dart';
import 'package:brandie/widgets/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oriflame',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily:
            GoogleFonts.poppins().fontFamily, // Global font for all text
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
          displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),

          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),

          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),

          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ).copyWith(primary: Color(0xff7EC086)),
      ),
      home: const MyHomePage(),
    );
  }
}