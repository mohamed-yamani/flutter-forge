import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextTheme get _latoTextTheme => GoogleFonts.latoTextTheme();
  static TextTheme get _montserratTextTheme =>
      GoogleFonts.montserratTextTheme();

  static TextStyle get displayLarge => _poppinsTextTheme.displayLarge!;
  static TextStyle get displayMedium => _poppinsTextTheme.displayMedium!;
  static TextStyle get displaySmall => _poppinsTextTheme.displaySmall!;

  static TextStyle get bodyLarge => _latoTextTheme.bodyLarge!;
  static TextStyle get bodyMedium => _latoTextTheme.bodyMedium!;
  static TextStyle get bodySmall => _latoTextTheme.bodySmall!;

  static TextStyle get titleLarge => _montserratTextTheme.titleLarge!;
  static TextStyle get titleMedium => _montserratTextTheme.titleMedium!;
  static TextStyle get titleSmall => _montserratTextTheme.titleSmall!;

  static TextStyle get headlineLarge => _montserratTextTheme.headlineLarge!;
  static TextStyle get headlineSmall => _montserratTextTheme.headlineSmall!;
  static TextStyle get headlineMedium => _montserratTextTheme.headlineMedium!;

  static getTextTheme() => TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        headlineLarge: headlineLarge,
        headlineSmall: headlineSmall,
        headlineMedium: headlineMedium,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get displayLarge => this.displayLarge!;
  TextStyle get displayMedium => this.displayMedium!;
  TextStyle get displaySmall => this.displaySmall!;

  TextStyle get bodyLarge => this.bodyLarge!;
  TextStyle get bodyMedium => this.bodyMedium!;
  TextStyle get bodySmall => this.bodySmall!;

  TextStyle get titleLarge => this.titleLarge!;
  TextStyle get titleMedium => this.titleMedium!;
  TextStyle get titleSmall => this.titleSmall!;

  TextStyle get headlineLarge => this.headlineLarge!;
  TextStyle get headlineSmall => this.headlineSmall!;
  TextStyle get headlineMedium => this.headlineMedium!;
}
