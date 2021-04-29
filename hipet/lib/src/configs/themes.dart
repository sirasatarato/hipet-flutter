import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    textTheme: _textTheme,
    accentColor: Color(0xFF4F41F9),
    primaryColor: Color(0xFF1B1B29),
  );
}

const _textTheme = TextTheme(
  headline1: TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 18,
    color: Colors.black,
  ),
  bodyText1: TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
  ),
  button: TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w600,
  ),
  caption: TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 12,
  ),
  subtitle1: TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 11,
    color: Colors.grey,
  ),
  subtitle2: TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 10,
  ),
);
