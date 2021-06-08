import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/util/hash_tag.dart';

class PostBottomComment extends StatelessWidget {
  final String content;
  final String date;

  PostBottomComment(this.content, this.date);

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
                    style: Get.textTheme.caption!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(date, style: Get.textTheme.caption!.copyWith(color: Colors.white)),
                ],
              ),
              Spacer(),
              getColoredHashTagText(content),
            ],
          ),
        ),
      ),
    );
  }
}
