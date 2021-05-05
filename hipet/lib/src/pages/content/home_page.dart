import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/home_content_controller.dart';
import 'package:hipet/src/util/hash_tag.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatelessWidget {
  final HomeContentController _homeContentController = Get.put(HomeContentController());
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    _homeContentController.getPosts();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              SvgPicture.asset('assets/icon/svg/thumbnail_recommend.svg'),
              Spacer(flex: 4),
              Text('팔로잉', style: Get.textTheme.button!.copyWith(color: Colors.white)),
              Spacer(),
              Text('추천', style: Get.textTheme.button!.copyWith(color: Colors.white)),
              Spacer(flex: 4),
              SvgPicture.asset('assets/icon/svg/bell.svg'),
            ],
          ),
        ),
      ),
      body: Obx(() => PageView(
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
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.network(''),
                                SizedBox(height: 16),
                                SvgPicture.asset('assets/icon/svg/like.svg'),
                                Text('0'),
                                SizedBox(height: 16),
                                SvgPicture.asset('assets/icon/svg/feed.svg'),
                                Text('0'),
                                SizedBox(height: 16),
                                SvgPicture.asset('assets/icon/svg/share.svg'),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              height: Get.height / 8,
                              color: Colors.black.withOpacity(0.1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('인기가 많은 댕댕이',
                                          style: Get.textTheme.caption!.copyWith(fontWeight: FontWeight.bold)),
                                      Text('2021-02-23', style: Get.textTheme.caption),
                                    ],
                                  ),
                                  Spacer(),
                                  getColoredHashTagText('저희집 댕댕이에요ㅠ 너무 귀엽죠ㅠㅠ\n진짜 사랑스러워요~~ #졸귀 #강아지'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              );
            }).toList(),
          )),
    );
  }
}
