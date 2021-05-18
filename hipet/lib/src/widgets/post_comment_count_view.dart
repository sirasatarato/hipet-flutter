import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PostCommentCountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icon/svg/feed.svg'),
        Text('0', style: Get.textTheme.caption!.copyWith(color: Colors.white)),
      ],
    );
  }
}
