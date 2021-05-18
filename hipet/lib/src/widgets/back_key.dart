import 'package:flutter/material.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:get/get.dart';

class BackKey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(MfgLabs.left),
      iconSize: 16,
      color: Colors.black,
      onPressed: () => Get.back(),
    );
  }
}
