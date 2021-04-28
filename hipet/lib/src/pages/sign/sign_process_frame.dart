import 'package:flutter/material.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';

// ignore: must_be_immutable
class SignProcessFrame extends StatelessWidget {
  var signNavController = Get.put(SignUpNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(context),
        body: signNavController.getPage(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(MfgLabs.left),
        color: Colors.black,
        iconSize: 16,
        onPressed: () => signNavController.backPage(),
      ),
      title: Text(
        signNavController.getTitle(),
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
