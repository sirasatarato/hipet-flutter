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
      children: posts
          .map((e) => Stack(
                children: [
                  Container(color: Colors.grey),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.black,
                        ),
                        label: Text(
                          e.view.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
          .toList(),
    );
  }
}
