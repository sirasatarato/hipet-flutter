import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PostLikeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icon/svg/like.svg'),
        Text('0', style: Get.textTheme.caption!.copyWith(color: Colors.white)),
      ],
    );
  }
}
