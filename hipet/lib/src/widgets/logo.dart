import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;

  const Logo({Key? key, this.width = 120, this.height = 120}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icon/logo/logo.png',
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
