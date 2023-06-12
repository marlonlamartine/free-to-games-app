import 'package:flutter/material.dart';
import 'package:games_free/app/core/ui/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyles? _instance;
  // Avoid self isntance
  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get primaryText => GoogleFonts.abel();
  TextStyle get textTitle => primaryText.copyWith(
      fontWeight: FontWeight.bold, fontSize: 22, color: kFontColor);
  TextStyle get textGameTitle => primaryText.copyWith(
      fontWeight: FontWeight.bold, fontSize: 20, color: kFontColor);
  TextStyle get textComment =>
      primaryText.copyWith(fontSize: 16, color: kFontColor);
  TextStyle get textButton => primaryText.copyWith(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
