import 'package:booking/theme.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  CustomColors get color => Theme.of(this).extension<CustomColors>()!;
  ThemeData get theme => Theme.of(this);
  double get adaptiveWidth => MediaQuery.of(this).size.width;
}
