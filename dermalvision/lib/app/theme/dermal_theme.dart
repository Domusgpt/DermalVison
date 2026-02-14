import 'package:flutter/material.dart';
import 'color_tokens.dart';

class DermalTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DermalColors.surface0,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: DermalColors.tealCore,
        onPrimary: Colors.white,
        secondary: DermalColors.seafoam,
        onSecondary: Colors.white,
        tertiary: DermalColors.amber,
        onTertiary: Colors.black,
        error: DermalColors.concern,
        onError: Colors.white,
        surface: DermalColors.surface1,
        onSurface: DermalColors.textOnDark,
      ),
      cardTheme: CardThemeData(
        color: DermalColors.surface1,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: DermalColors.surface2, width: 1),
        ),
      ),
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Space Grotesk',
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: DermalColors.textOnDark,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Space Grotesk',
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: DermalColors.textOnDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: DermalColors.textOnDark,
        ),
      ),
    );
  }
}
