import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
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
              fontWeight: FontWeight.w600
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
        )
      ),
      home: Scaffold(
        body: Container(),
      )
    );
  }
}