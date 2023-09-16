import 'package:booking/presentation/theme.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static const TextStyle appBarTitle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle ratingLabel({required Color color}) => TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'SFProDisplay500',
      );

  static const TextStyle hotelName = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay500',
  );
  static TextStyle get roomName => hotelName;

  static TextStyle hotelAddress = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppTheme.appColors.addressColor,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle get roomMoreInfoLabel =>
      ratingLabel(color: AppTheme.appColors.addressColor);

  static const TextStyle price = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    fontFamily: 'SFProDisplay600',
  );

  static TextStyle priceForItLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppTheme.appColors.secondaryTextColor,
    fontFamily: 'SFProDisplay400',
  );

  static const TextStyle aboutHotelHeader = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay500',
  );

  static const TextStyle hotelDescription = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    wordSpacing: 1,
    fontFamily: 'SFProDisplay400',
  );
  static TextStyle peculiarity = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppTheme.appColors.secondaryTextColor,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle detailName = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle detailValue = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppTheme.appColors.secondaryTextColor,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle buttonLabel = const TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay400',
  );

  static TextStyle bookingInfoName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProDisplay400',
    color: AppTheme.appColors.secondaryTextColor,
  );

  static TextStyle bookingInfoValue = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProDisplay400',
  );
}
