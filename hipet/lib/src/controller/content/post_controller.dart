import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/mixin/api_core.dart';
import 'package:hipet/src/model/post_model.dart';

class PostController extends GetxController with ApiCore {
  final _posts = <Post>[].obs;
  final _currentPostIdx = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  List<Post> get posts => _posts;

  int get currentPostIdx => _currentPostIdx.value;

  set currentPostIdx(int idx) => _currentPostIdx.value = idx;

  Post? getCurrentPost() {
    if(posts.isEmpty) return null;

    return posts[currentPostIdx];
  }

  PostController() {
    dio.get('api/post').then((response) => print(response.data));
    update();
  }
}
