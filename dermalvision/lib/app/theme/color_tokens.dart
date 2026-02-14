import 'package:flutter/material.dart';

class DermalColors {
  // Primary Palette
  static const Color deepOcean = Color(0xFF0A1628);
  static const Color tealCore = Color(0xFF0D3B4F);
  static const Color seafoam = Color(0xFF1A6B5A);
  static const Color warmSand = Color(0xFFC4956A);
  static const Color amber = Color(0xFFD4894E);

  // Surface System
  static const Color surface0 = Color(0xFF060E18);
  static const Color surface1 = Color(0xFF0F1D2E);
  static const Color surface2 = Color(0xFF162A3E);
  static const Color surface3 = Color(0xFF1C3550);
  static const Color surface4 = Color(0xFF234060);
  static const Color textOnDark = Color(0xFFE8E0D8);

  // Semantic Colors
  static const Color safe = Color(0xFF2ECC71);
  static const Color caution = Color(0xFFF39C12);
  static const Color concern = Color(0xFFE74C3C);
  static const Color neutral = Color(0xFF5DADE2);

  // Gradients
  static const LinearGradient skinShurpaGradient = LinearGradient(
    colors: [Color(0xFF8E44AD), Color(0xFF3498DB)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient premiumGradient = LinearGradient(
    colors: [Color(0xFFF4D03F), Color(0xFFD4894E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
