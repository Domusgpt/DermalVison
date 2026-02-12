import 'package:dermalvision/app/theme/color_tokens.dart';
import 'package:flutter/material.dart';

class DermalTheme {
  const DermalTheme._();

  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      seedColor: ColorTokens.primary,
      brightness: Brightness.dark,
      surface: ColorTokens.surface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: ColorTokens.background,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontWeight: FontWeight.w700),
        titleLarge: TextStyle(fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(height: 1.4),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorTokens.textPrimary,
      ),
      cardTheme: CardTheme(
        color: ColorTokens.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
