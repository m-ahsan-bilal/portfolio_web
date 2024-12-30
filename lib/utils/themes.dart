import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme getTextTheme(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).size.width / 375.0;

    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 32 * scaleFactor,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: 24 * scaleFactor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 16 * scaleFactor,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14 * scaleFactor,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontSize: 12 * scaleFactor,
        fontWeight: FontWeight.normal,
      ),
      // Add more text styles as needed
    );
  }
}

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: CustomTextTheme.getTextTheme(context),
      primaryColor: Colors.blue,
      hintColor: Colors.amber,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: CustomTextTheme.getTextTheme(context),
      primaryColor: Colors.grey[900],
      hintColor: Colors.cyan,
    );
  }
}
