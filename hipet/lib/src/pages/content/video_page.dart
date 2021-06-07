import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content/post_controller.dart';
import 'package:hipet/src/widgets/post_bottom_comment.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  final PostController _postController = Get.find();

  @override
  Widget build(BuildContext context) {
    if(_postController.posts.isEmpty) return Container();

    return PageView(
      scrollDirection: Axis.vertical,
      controller: _postController.pageController,
      onPageChanged: (idx) => _postController.currentPostIdx = idx,
      children: _postController.posts.map((post) {
        var _videoController = VideoPlayerController.network(post.media);

        return FutureBuilder(
          future: _videoController.setLooping(true),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  VideoPlayer(_videoController),
                  PostBottomComment(post.content, post.date),
                ],
              );
            }

            return Container();
          },
        );
      }).toList(),
    );
  }
}
