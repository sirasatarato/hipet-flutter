import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('좋아요'),
        actions: [ SvgPicture.asset('assets/icon/svg/bell.svg') ],
      ),
      body: GridView.count(
        childAspectRatio: Get.width / Get.height,
        crossAxisCount: 3,
        children: [
          Container(),
          Container(color: Colors.grey),
          Container(),
          Container(color: Colors.grey),
        ],
      ),
    );
  }
}
