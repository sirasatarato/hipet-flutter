import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/util/hash_tag.dart';

class PostBottomComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BackdropFilter(
        filter: ImageFilter.blur(),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: Get.height / 8,
          color: Colors.black.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '인기가 많은 댕댕이',
                    style: Get.textTheme.caption!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text('2021-02-23', style: Get.textTheme.caption),
                ],
              ),
              Spacer(),
              getColoredHashTagText('저희집 댕댕이에요ㅠ 너무 귀엽죠ㅠㅠ\n진짜 사랑스러워요~~ #졸귀 #강아지'),
            ],
          ),
        ),
      ),
    );
  }
}
