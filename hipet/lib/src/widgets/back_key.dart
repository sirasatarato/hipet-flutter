import 'package:flutter/material.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:get/get.dart';

class BackKey extends StatelessWidget {
  final Color color;

  const BackKey({this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(MfgLabs.left),
      iconSize: 16,
      color: color,
      onPressed: () => Get.back(),
    );
  }
}
