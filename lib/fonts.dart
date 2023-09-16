import 'package:booking/theme.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static const TextStyle appBarTitle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle ratingLabel({required Color color}) =>
      TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500);

  static const TextStyle hotelName = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static TextStyle hotelAddress = TextStyle(
      fontWeight: FontWeight.w500, color: AppTheme.appColors.addressColor);

  static const TextStyle price =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static TextStyle priceForItLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppTheme.appColors.secondaryTextColor,
  );

  static const TextStyle aboutHotelHeader = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle hotelDescription = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    wordSpacing: 1,
  );
  static TextStyle peculiarity = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppTheme.appColors.secondaryTextColor,
  );

  static TextStyle detailName = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle detailValue = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppTheme.appColors.secondaryTextColor,
  );
}
