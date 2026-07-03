import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.secondary,
      secondary: AppColors.grey600,
      onSecondary: AppColors.secondary,
      surface: AppColors.background,
      onSurface: AppColors.textPrimary,
      error: AppColors.error,
      outline: AppColors.border,
    ),

    textTheme: GoogleFonts.interTextTheme(
      const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          letterSpacing: -0.5,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          letterSpacing: -0.3,
          height: 1.3,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
          letterSpacing: -0.2,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textTertiary,
          height: 1.5,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.secondary,
          letterSpacing: 0.2,
        ),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      foregroundColor: AppColors.textPrimary,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.secondary,
        elevation: 0,
        minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
        side: const BorderSide(color: AppColors.border, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.accent,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: 18,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      hintStyle: const TextStyle(
        color: AppColors.textTertiary,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      prefixIconColor: AppColors.grey600,
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.backgroundDark,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      onPrimary: AppColors.secondaryDark,
      secondary: AppColors.grey600,
      onSecondary: AppColors.secondaryDark,
      surface: AppColors.backgroundDark,
      onSurface: AppColors.textPrimaryDark,
      error: AppColors.error,
      outline: AppColors.borderDark,
    ),

    textTheme: GoogleFonts.interTextTheme(
      const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryDark,
          letterSpacing: -0.5,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryDark,
          letterSpacing: -0.3,
          height: 1.3,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
          letterSpacing: -0.2,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimaryDark,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textTertiary,
          height: 1.5,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.secondaryDark,
          letterSpacing: 0.2,
        ),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      foregroundColor: AppColors.textPrimaryDark,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.secondaryDark,
        elevation: 0,
        minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
        minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
        side: const BorderSide(color: AppColors.borderDark, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryDark,
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.accentDark,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: 18,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: const BorderSide(color: AppColors.primaryDark, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      hintStyle: const TextStyle(
        color: AppColors.textTertiary,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      prefixIconColor: AppColors.grey600,
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.dividerDark,
      thickness: 1,
      space: 0,
    ),
  );
}