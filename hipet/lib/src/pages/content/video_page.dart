import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content/post_controller.dart';
import 'package:hipet/src/controller/content/write_content_controller.dart';
import 'package:hipet/src/widgets/post_bottom_comment.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  final PostController _postController = Get.find();
  final WriteContentController _writeContentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FutureBuilder(
        future: _writeContentController.getVideo(_postController.mainPost.media),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          var _videoController = VideoPlayerController.file(snapshot.data);
          return FutureBuilder(
            future: _videoController.setLooping(true),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    FutureBuilder(
                      future: _videoController.initialize(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if (_videoController.value.isInitialized) {
                          _videoController.play();
                          _videoController.setLooping(true);
                        }

                        return _videoController.value.isInitialized ? VideoPlayer(_videoController) : Container();
                      },
                    ),
                    PostBottomComment(_postController.mainPost.content, _postController.mainPost.date),
                  ],
                );
              }

              return Container();
            },
          );
        },
      ),
    );
  }
}
