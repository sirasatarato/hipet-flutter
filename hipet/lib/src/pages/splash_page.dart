import 'package:flutter/material.dart';
import 'package:hipet/src/widgets/logo.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1B1B29),
      body: Center(child: Logo(width: 240, height: 240)),
    );
  }
}
