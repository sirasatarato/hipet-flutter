import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getColoredHashTagText(String text) {
  if (text.contains('#')) {
    String preHashTag = text.substring(0, text.indexOf('#'));
    String postHashTag = text.substring(preHashTag.length);

    return RichText(
      text: TextSpan(
        style: Get.textTheme.caption,
        children: <TextSpan>[
          TextSpan(text: preHashTag),
          TextSpan(text: postHashTag, style: TextStyle(color: Colors.yellow)),
        ],
      ),
    );
  } else {
    return Text(text);
  }
}