import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiTheme {
  static final primaryColor = Color(0xFF8A2BE2);
  static final secondaryColor = Color(0xFF6C757D);
  static final textColorBlack = Color(0xFF212529);
  static final textColorWhite = Color(0xFFFFFFFF);
  static final primarySuccess = Color.fromRGBO(10, 180, 68, 0.75);
  static final primaryFailure = Color.fromRGBO(250, 18, 18, 0.75);
  static final primaryGradientStart = Color(0xFFB689DF);
  static final primaryGradientEnd = Color(0xFF8A2BE2);
  static final secondaryGradientStart = Color.fromRGBO(236, 251, 246, 0);
  static final secondaryGradientEnd = Color.fromRGBO(138, 43, 226, 0.7);

  static final primaryColorScheme = ColorScheme.fromSwatch(primarySwatch: Colors.purple);

  static final _textTheme = GoogleFonts.abelTextTheme(
    TextTheme(
      headline1: TextStyle(
        color: textColorBlack,
        fontSize: 40.0,
        fontWeight: FontWeight.w900,
        letterSpacing: 3,
      ),
      headline2: TextStyle(
        color: textColorBlack,
        fontSize: 36.0,
        fontWeight: FontWeight.w700,
      ),
      headline3: TextStyle(
        color: textColorBlack,
        fontSize: 34.0,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        color: textColorBlack,
        fontSize: 34.0,
        fontWeight: FontWeight.w300,
      ),
      headline5: TextStyle(
        color: textColorBlack,
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        color: textColorBlack,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        color: textColorBlack,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
      subtitle2: TextStyle(
        color: Colors.grey[900],
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        letterSpacing: 1,
      ),
      button: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
    ),
  );

  static final lightTheme = ThemeData.from(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    textTheme: _textTheme,
  );
}
