import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilem/design/my_ds/colors.dart';

ThemeData myDsTheme(BuildContext context) {
  final themeData = Theme.of(context);
  final textTheme = themeData.textTheme;

  /// You can change the font-family as you need
  final myDsTextTheme = textTheme.copyWith(
    displayLarge: GoogleFonts.aBeeZee(
      fontSize: 40.sp,
      fontWeight: FontWeight.w800,
    ),
    displayMedium: GoogleFonts.aBeeZee(
      fontSize: 36.sp,
      fontWeight: FontWeight.w800,
    ),
    displaySmall: GoogleFonts.aBeeZee(
      fontSize: 32.sp,
      fontWeight: FontWeight.w800,
    ),
    headlineLarge: GoogleFonts.aBeeZee(
      fontSize: 28.sp,
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: GoogleFonts.aBeeZee(
      fontSize: 24.sp,
      fontWeight: FontWeight.w800,
    ),
    headlineSmall: GoogleFonts.aBeeZee(
      fontSize: 22.sp,
      fontWeight: FontWeight.w800,
    ),
    titleLarge: GoogleFonts.aBeeZee(
      fontSize: 20.sp,
      fontWeight: FontWeight.w800,
    ),
    titleMedium: GoogleFonts.aBeeZee(
      fontSize: 16.sp,
      fontWeight: FontWeight.w800,
    ),
    titleSmall: GoogleFonts.aBeeZee(
      fontSize: 14.sp,
      fontWeight: FontWeight.w800,
    ),
    bodyLarge: GoogleFonts.aBeeZee(
      fontSize: 16.sp,
    ),
    bodyMedium: GoogleFonts.aBeeZee(
      fontSize: 14.sp,
    ),
    bodySmall: GoogleFonts.aBeeZee(
      fontSize: 12.sp,
    ),
    labelLarge: GoogleFonts.aBeeZee(
      fontSize: 14.sp,
    ),
    labelMedium: GoogleFonts.aBeeZee(
      fontSize: 12.sp,
    ),
    labelSmall: GoogleFonts.aBeeZee(
      fontSize: 11.sp,
    ),
  );

  return ThemeData(
    colorScheme: const ColorScheme.light(
      primary: MyDsColors.primaryBase,
      secondary: MyDsColors.primaryLight,
      tertiary: MyDsColors.primaryInvert,
      onPrimary: MyDsColors.white,
      onBackground: MyDsColors.neutralOne,
      error: MyDsColors.alert,
    ),
    useMaterial3: false,
    textTheme: myDsTextTheme,
  );
}
