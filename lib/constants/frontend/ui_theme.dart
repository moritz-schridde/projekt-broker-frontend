import 'package:flutter/material.dart';

class UiTheme {
  static final primaryColor = Colors.purple;
  static final secondaryColor = Colors.purpleAccent;
  static final primaryColorScheme =
      ColorScheme.fromSwatch(primarySwatch: primaryColor);

  static final textTheme = TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 40.0,
      fontWeight: FontWeight.w900,
      letterSpacing: 3,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 36.0,
      fontWeight: FontWeight.w700,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontSize: 34.0,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 34.0,
      fontWeight: FontWeight.w300,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
    ),
    headline6: TextStyle(
      color: Colors.black,
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
      color: Colors.black,
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
  );

  static final lightTheme = ThemeData.from(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
  );

  static final darkTheme = ThemeData.from(
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
  );
}
