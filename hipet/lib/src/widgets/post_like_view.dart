import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PostLikeCountView extends StatelessWidget {
  final int likeCount;

  PostLikeCountView(this.likeCount);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icon/svg/like.svg'),
        Text(
          likeCount.toString(),
          style: Get.textTheme.caption!.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
