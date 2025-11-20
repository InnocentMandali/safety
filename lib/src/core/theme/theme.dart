
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xFF6A1B9A); // A deep, rich purple
  static const Color _secondaryColor = Color(0xFFF50057); // A vibrant pink for accents

  static ThemeData get lightTheme {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
      secondary: _secondaryColor,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _textTheme(colorScheme.onSurface),
      appBarTheme: _appBarTheme(colorScheme),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
    );
  }

  static ThemeData get darkTheme {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.dark,
      secondary: _secondaryColor,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _textTheme(colorScheme.onSurface),
      appBarTheme: _appBarTheme(colorScheme),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
    );
  }

  static TextTheme _textTheme(Color onSurfaceColor) {
    return GoogleFonts.latoTextTheme(
      const TextTheme(
        displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ).apply(bodyColor: onSurfaceColor, displayColor: onSurfaceColor),
    );
  }

  static AppBarTheme _appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 4,
      titleTextStyle: GoogleFonts.lato(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.primary, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colorScheme.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colorScheme.secondary, width: 2),
      ),
      labelStyle: TextStyle(color: colorScheme.onSurface.withAlpha((0.8 * 255).round())),
    );
  }
}
