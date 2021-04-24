import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/configs/themes.dart';
import 'package:hipet/src/pages/sign_page.dart';
import 'package:hipet/src/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 0)),
        builder: (context, AsyncSnapshot snapshot) =>
            snapshot.connectionState == ConnectionState.waiting ? SplashPage() : SignPage(),
      ),
    );
  }
}
