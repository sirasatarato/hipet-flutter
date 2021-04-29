import 'package:flutter/material.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';

class SignProcessFrame extends StatelessWidget {
  final SignUpNavController signNavController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(),
      body: Obx(() => signNavController.getPage()),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(MfgLabs.left),
        iconSize: 16,
        color: Colors.black,
        onPressed: () => signNavController.backPage(),
      ),
      title: Obx(
        () => Text(
          signNavController.getTitle(),
          style: Get.textTheme.headline1,
        ),
      ),
    );
  }
}
