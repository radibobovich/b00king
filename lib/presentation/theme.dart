import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData mainTheme = ThemeData(
    fontFamily: 'SFProDisplay500',
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFFF6F6F9),
    dividerTheme: const DividerThemeData(color: Color(0xFFE9EAEC)),
  );

  static const appColors = CustomColors(
      addressColor: Color(0xFF0D72FF),
      bestRatingTextColor: Color(0xFFFFA800),
      bestRatingBackgroundColor: Color(0x33FFC700),
      anyRatingBackgroundColor: Color(0xFFE7F1FF),
      anyRatingTextColor: Color(0xFF0D72FF),
      secondaryTextColor: Color(0xFF828796),
      blockBackgroundColor: Colors.white,
      itemBackgroundColor: Color(0xFFFBFBFC));
}

class CustomColors {
  final Color bestRatingBackgroundColor;
  final Color bestRatingTextColor;

  final Color anyRatingBackgroundColor;
  final Color anyRatingTextColor;

  final Color addressColor;
  final Color secondaryTextColor;

  final Color blockBackgroundColor;
  final Color itemBackgroundColor;
  const CustomColors({
    required this.bestRatingBackgroundColor,
    required this.bestRatingTextColor,
    required this.anyRatingBackgroundColor,
    required this.anyRatingTextColor,
    required this.addressColor,
    required this.secondaryTextColor,
    required this.blockBackgroundColor,
    required this.itemBackgroundColor,
  });
}
