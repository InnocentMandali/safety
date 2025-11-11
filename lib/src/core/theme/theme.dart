
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 57,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 57,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
        ),
      ),
    );
  }
}
