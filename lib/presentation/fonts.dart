import 'package:booking/presentation/theme.dart';
import 'package:flutter/material.dart';

/// Fonts that are used globally in the app.
///
/// [fontFamily] property is used instead of [fontWeight] because of the
/// workaround in pubspec.yaml
class AppFonts {
  // TODO: fix hardcoded colors
  static TextStyle appBarTitle = TextStyle(
    color: AppTheme.appColors.textColor,
    fontSize: 18,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle ratingLabel({required Color color}) => TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: 'SFProDisplay500',
      );

  static const TextStyle hotelName = TextStyle(
    fontSize: 22,
    fontFamily: 'SFProDisplay500',
  );
  static TextStyle get roomName => hotelName;

  static TextStyle hotelAddress = TextStyle(
    color: AppTheme.appColors.addressColor,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle get roomMoreInfoLabel =>
      ratingLabel(color: AppTheme.appColors.addressColor);

  static const TextStyle price = TextStyle(
    fontSize: 30,
    fontFamily: 'SFProDisplay600',
  );

  static TextStyle priceForItLabel = TextStyle(
    fontSize: 16,
    color: AppTheme.appColors.secondaryTextColor,
    fontFamily: 'SFProDisplay400',
  );

  static const TextStyle aboutHotelHeader = TextStyle(
    fontSize: 22,
    fontFamily: 'SFProDisplay500',
  );

  static const TextStyle hotelDescription = TextStyle(
    fontSize: 16,
    wordSpacing: 1,
    fontFamily: 'SFProDisplay400',
  );
  static TextStyle peculiarity = TextStyle(
    fontSize: 16,
    color: AppTheme.appColors.secondaryTextColor,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle detailName = const TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle detailValue = TextStyle(
    color: AppTheme.appColors.secondaryTextColor,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle buttonLabel = const TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay400',
  );

  static TextStyle bookingInfoName = TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay400',
    color: AppTheme.appColors.secondaryTextColor,
  );

  static TextStyle bookingInfoValue = const TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay400',
  );

  static TextStyle customerInfoHeader = const TextStyle(
    fontSize: 22,
    fontFamily: 'SFProDisplay500',
  );

  static TextStyle textFieldValue = TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay400',
    color: AppTheme.appColors.textFieldValueColor,
  );

  static TextStyle textFieldHint = TextStyle(
    fontSize: 17,
    fontFamily: 'SFProDisplay400',
    color: AppTheme.appColors.textFieldHintColor,
  );

  static TextStyle textFieldLabel = TextStyle(
    fontSize: 17,
    fontFamily: 'SFProDisplay400',
    color: AppTheme.appColors.textFieldHintColor,
  );

  static TextStyle customerInfoHint = TextStyle(
    fontSize: 14,
    fontFamily: 'SFProDisplay400',
    color: AppTheme.appColors.secondaryTextColor,
  );
  static TextStyle touristLabel = TextStyle(
    fontSize: 22,
    fontFamily: 'SFProDisplay500',
    color: AppTheme.appColors.textColor,
  );

  static TextStyle totalPriceLabel = TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay600',
    color: AppTheme.appColors.addressColor,
  );

  static TextStyle paidLabel = TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay400',
    color: AppTheme.appColors.secondaryTextColor,
    height: 2,
  );

  static TextStyle errorSnackbarLabel = TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay400',
    color: AppTheme.appColors.textColor,
  );
}
