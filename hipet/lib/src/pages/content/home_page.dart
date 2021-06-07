import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content/post_controller.dart';
import 'package:hipet/src/mixin/appbar_maker.dart';
import 'package:hipet/src/pages/content/video_page.dart';
import 'package:hipet/src/widgets/circular_image_view.dart';
import 'package:hipet/src/widgets/post_comment_count_view.dart';
import 'package:hipet/src/widgets/post_like_view.dart';

class HomePage extends StatelessWidget with AppbarMaker {
  final PostController _postController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppBarWithVideos(),
      body: Stack(
        children: [
          VideoPage(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(() => buildActions()),
          ),
        ],
      ),
    );
  }

  Container buildActions() {
    var post = _postController.getCurrentPost();

    return Container(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: Get.width * 0.1,
            height: Get.width * 0.1,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: CircularImageView(post?.media ?? ''),
          ),
          SizedBox(height: 8),
          PostLikeCountView(post?.like ?? 0),
          SizedBox(height: 8),
          PostCommentCountView(),
          SizedBox(height: 8),
          SvgPicture.asset('assets/icon/svg/share.svg'),
        ],
      ),
    );
  }
}
