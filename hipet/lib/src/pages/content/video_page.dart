import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  // final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // return PageView(
    //   scrollDirection: Axis.vertical,
    //   controller: _pageController,
    //   children: getPostMedia().map((url) {
    //     var _videoController = VideoPlayerController.network(url);
    //
    //     return FutureBuilder(
    //       future: _videoController.setLooping(true),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return Stack(
    //             children: [
    //               VideoPlayer(_videoController),
    //               PostBottomComment(),
    //             ],
    //           );
    //         }
    //
    //         return Container();
    //       },
    //     );
    //   }).toList(),
    // );

    return Container();
  }
}
