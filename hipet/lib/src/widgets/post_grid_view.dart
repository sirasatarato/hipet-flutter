import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/model/post_model.dart';

class PostGridView extends StatelessWidget {
  final List<Post> posts;

  const PostGridView(this.posts);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: Get.width / Get.height,
      crossAxisCount: 3,
      children: posts.map((e) => Container()).toList(),
    );
  }
}
