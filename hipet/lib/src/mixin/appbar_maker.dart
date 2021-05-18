import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hipet/src/widgets/back_key.dart';

mixin AppbarMaker {
  AppBar buildAppBarWithBackKey(String title) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: BackKey(),
      title: Text(
        title,
        style: Get.textTheme.headline1,
      ),
    );
  }

  AppBar buildAppBarWithNotification(String title) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Text(
        title,
        style: Get.textTheme.headline1!.copyWith(color: Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SvgPicture.asset('assets/icon/svg/bell.svg'),
        )
      ],
    );
  }
}
