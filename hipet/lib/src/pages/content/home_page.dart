import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/home_content_controller.dart';
import 'package:hipet/src/mixin/appbar_maker.dart';
import 'package:hipet/src/widgets/circular_image_view.dart';
import 'package:hipet/src/widgets/post_comment_count_view.dart';
import 'package:hipet/src/widgets/post_like_view.dart';

import 'video_page.dart';

class HomePage extends StatelessWidget with AppbarMaker {
  final HomeContentController _homeContentController = Get.put(HomeContentController());

  @override
  Widget build(BuildContext context) {
    _homeContentController.getPosts();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppBarWithVideos(),
      body: Stack(
        children: [
          VideoPage(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: buildActions(),
          ),
        ],
      ),
    );
  }

  Container buildActions() {
    return Container(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: Get.height / 2),
          Container(
            width: Get.width * 0.1,
            height: Get.width * 0.1,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: CircularImageView(''),
          ),
          PostLikeView(),
          PostCommentCountView(),
          SvgPicture.asset('assets/icon/svg/share.svg'),
        ],
      ),
    );
  }
}
