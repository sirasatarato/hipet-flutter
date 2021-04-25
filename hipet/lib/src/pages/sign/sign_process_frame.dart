import 'package:flutter/material.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';

class SignProcessFrame extends StatelessWidget {
  var signNavController = Get.put(SignUpNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(MfgLabs.left),
            color: Colors.black,
            iconSize: 16,
            onPressed: () => signNavController.backPage(),
          ),
          title: Text(
            signNavController.getTitle(),
            style: Theme
                .of(context)
                .textTheme
                .headline1,
          ),
          centerTitle: true,
        ),
        body: signNavController.getPage(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
