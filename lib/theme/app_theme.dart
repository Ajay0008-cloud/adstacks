import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors matching exact screenshot
  static const Color primaryPurple = Color(0xFF8B5CF6); // Vibrant Indigo Purple
  static const Color primaryDarkPurple = Color(0xFF6D28D9);
  static const Color darkNavy = Color(0xFF0F1225); // Sleek Deep Navy Background
  static const Color darkNavyCard = Color(0xFF191C35); // Card container dark navy
  static const Color bgLight = Color(0xFFF3F4F9); // Crisp Off-White Light Gray Background
  static const Color cardLight = Colors.white;

  // Vibrant Accents matching screenshot
  static const Color coralRed = Color(0xFFFF3B5C);
  static const Color coralPink = Color(0xFFFF3B5C);
  static const Color deepTeal = Color(0xFF00B495);
  static const Color royalPurple = Color(0xFF7C3AED);
  static const Color tealAccent = Color(0xFF10B981);
  static const Color orangeAccent = Color(0xFFFF9F43);
  static const Color goldStar = Color(0xFFFBBF24); // Sparkling stars yellow gold
  static const Color textDark = Color(0xFF0F172A);
  static const Color textMuted = Color(0xFF64748B); // Slightly darker for enhanced readability

  // Gradients matching reference image
  static const LinearGradient bannerGradient = LinearGradient(
    colors: [Color(0xFFA855F7), Color(0xFFEC4899), Color(0xFF3B82F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient projectCardRed = LinearGradient(
    colors: [Color(0xFFFF3B5C), Color(0xFFE11D48)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient projectCardTeal = LinearGradient(
    colors: [Color(0xFF0D9488), Color(0xFF115E59)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient projectCardPurple = LinearGradient(
    colors: [Color(0xFF7C3AED), Color(0xFF4C1D95)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient wishingButtonGradient = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: bgLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPurple,
        brightness: Brightness.light,
        surface: cardLight,
      ),
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: textDark,
        displayColor: textDark,
      ),
      cardTheme: CardThemeData(
        color: cardLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
