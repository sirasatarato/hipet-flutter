import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/home_content_controller.dart';
import 'package:hipet/src/widgets/post_bottom_comment.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  final HomeContentController _homeContentController = Get.find();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      children: _homeContentController.getPostMedia().map((url) {
        var _videoController = VideoPlayerController.network(url);

        return FutureBuilder(
          future: _videoController.setLooping(true),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  VideoPlayer(_videoController),
                  PostBottomComment(),
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
