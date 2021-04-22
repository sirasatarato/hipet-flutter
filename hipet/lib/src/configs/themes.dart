import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    textTheme: _textTheme,
  );
}

const _textTheme = TextTheme(
  headline1: TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 18,
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
  ),
  subtitle2: TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 10,
  ),
);
