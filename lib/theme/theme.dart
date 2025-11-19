
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey[100],
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      textTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        elevation: 0,
        titleTextStyle: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey[900],
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.latoTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[850],
        elevation: 0,
        titleTextStyle: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
