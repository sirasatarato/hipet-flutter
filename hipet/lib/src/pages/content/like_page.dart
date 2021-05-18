import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/mixin/appbar_maker.dart';

class LikePage extends StatelessWidget with AppbarMaker {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithNotification('좋아요'),
      body: GridView.count(
        childAspectRatio: Get.width / Get.height,
        crossAxisCount: 3,
        children: [],
      ),
    );
  }
}
