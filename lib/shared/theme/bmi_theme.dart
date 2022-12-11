import 'package:flutter/material.dart';

class BmiTheme {
  static final theme = ThemeData(
      primaryColor: Color(0xFF60cfda),
      highlightColor: Color(0xFFEDF4F8),
      scaffoldBackgroundColor: Color(0xFFededed),
      brightness: Brightness.light,
      textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Nimbus Bold',
              fontSize: 20,
              color: Color(0xFF51565A)),
          headline2: TextStyle(
            fontFamily: 'Nimbus',
            fontSize: 16,
            color: Color(0xFFb8bcc8),
          ),
          bodyText1: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            color: Color(0xFF51565A),
          ),
          bodyText2: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              color: Color(0xFF51565A))));
}
