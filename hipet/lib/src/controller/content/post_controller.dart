import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/mixin/api_core.dart';
import 'package:hipet/src/model/post_model.dart';

class PostController extends GetxController with ApiCore {
  final PageController pageController = PageController(initialPage: 0);
  final _mainPost = Post.empty().obs;

  Post get mainPost => _mainPost.value;

  PostController() {
    dio.get('api/post').then((response) {
      if((response.data as String).isNotEmpty) _mainPost.value = Post.fromJson(response.data);
    });
  }
}
