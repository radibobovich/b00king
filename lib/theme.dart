import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData mainTheme = ThemeData(
    fontFamily: 'SFProDisplay',
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFFF6F6F9),
    dividerTheme: const DividerThemeData(color: Color(0xFFE9EAEC)),
  );

  static const appColors = CustomColors(
      addressColor: Color(0xFF0D72FF),
      bestRatingTextColor: Color(0xFFFFA800),
      bestRatingBackgroundColor: Color(0x33FFC700),
      anyRatingBackgroundColor: Color(0xFF95B8DA),
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
// class CustomColors extends ThemeExtension<CustomColors> {
//   final Color bestRatingBackgroundColor;
//   final Color bestRatingTextColor;

//   final Color anyRatingBackgroundColor;
//   final Color anyRatingTextColor;

//   final Color addressColor;
//   final Color secondaryTextColor;

//   final Color blockBackgroundColor;
//   final Color itemBackgroundColor;
//   const CustomColors({
//     required this.bestRatingBackgroundColor,
//     required this.bestRatingTextColor,
//     required this.anyRatingBackgroundColor,
//     required this.anyRatingTextColor,
//     required this.addressColor,
//     required this.secondaryTextColor,
//     required this.blockBackgroundColor,
//     required this.itemBackgroundColor,
//   });

//   @override
//   CustomColors copyWith(
//       {Color? bestRatingBackgroundColor,
//       Color? bestRatingTextColor,
//       Color? anyRatingBackgroundColor,
//       Color? anyRatingTextColor,
//       Color? addressColor,
//       Color? secondaryTextColor,
//       Color? blockBackgroundColor,
//       Color? itemBackgroundColor}) {
//     return CustomColors(
//       bestRatingBackgroundColor:
//           bestRatingBackgroundColor ?? this.bestRatingBackgroundColor,
//       bestRatingTextColor: bestRatingTextColor ?? this.bestRatingTextColor,
//       anyRatingBackgroundColor:
//           anyRatingBackgroundColor ?? this.anyRatingBackgroundColor,
//       anyRatingTextColor: anyRatingTextColor ?? this.anyRatingTextColor,
//       addressColor: addressColor ?? this.addressColor,
//       secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
//       blockBackgroundColor: blockBackgroundColor ?? this.blockBackgroundColor,
//       itemBackgroundColor: itemBackgroundColor ?? this.itemBackgroundColor,
//     );
//   }

//   @override
//   CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
//     if (other is! CustomColors) {
//       return this;
//     }
//     return CustomColors(
//       bestRatingBackgroundColor: Color.lerp(
//           bestRatingBackgroundColor, other.bestRatingBackgroundColor, t)!,
//       bestRatingTextColor:
//           Color.lerp(bestRatingTextColor, other.bestRatingTextColor, t)!,
//       anyRatingBackgroundColor: Color.lerp(
//           anyRatingBackgroundColor, other.anyRatingBackgroundColor, t)!,
//       anyRatingTextColor:
//           Color.lerp(anyRatingTextColor, other.anyRatingTextColor, t)!,
//       addressColor: Color.lerp(addressColor, other.addressColor, t)!,
//       secondaryTextColor:
//           Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
//       blockBackgroundColor:
//           Color.lerp(blockBackgroundColor, other.blockBackgroundColor, t)!,
//       itemBackgroundColor:
//           Color.lerp(itemBackgroundColor, other.itemBackgroundColor, t)!,
//     );
//   }
// }
