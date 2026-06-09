import 'package:flutter/material.dart';

class AppColors {
  static const Color navy = Color(0xFF111844);
  static const Color midBlue = Color(0xFF4B5694);
  static const Color lightBlue = Color(0xFF7288AE);
  static const Color cream = Color(0xFFEAE0CF);
}

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.navy,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.midBlue,
      secondary: AppColors.lightBlue,
      surface: Color(0xFF1A2255),
      onPrimary: AppColors.cream,
      onSurface: AppColors.cream,
    ),
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.navy,
      foregroundColor: AppColors.cream,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: AppColors.cream,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1A2255),
      selectedItemColor: AppColors.cream,
      unselectedItemColor: AppColors.lightBlue,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1A2255),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF4B5694), width: 0.5),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.cream,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        color: AppColors.cream,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: AppColors.cream,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: AppColors.cream,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(color: AppColors.cream),
      bodyMedium: TextStyle(color: Color(0xFFBDB5A6)),
      labelLarge: TextStyle(
        color: AppColors.lightBlue,
        fontWeight: FontWeight.w600,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFF2A3465),
      thickness: 1,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.cream,
    ),
  );
}
