import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1B29),
      body: Center(
        child: Image.asset('assets/icon/logo/logo.png', fit: BoxFit.cover, width: 240, height: 240,),
      ),
    );
  }
}
