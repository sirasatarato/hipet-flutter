import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hipet/src/util/hash_tag.dart';

class HomePage extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          PageView(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            children: const <Widget>[
              Center(child: Text('First Page')),
              Center(child: Text('Second Page')),
              Center(child: Text('Third Page')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/icon/svg/thumbnail_recommend.svg'),
                SizedBox(),
                Text('팔로잉'),
                Text('추천'),
                SizedBox(),
                SvgPicture.asset('assets/icon/svg/bell.svg'),
              ],
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
                        Text('인기가 많은 댕댕이', style: Get.textTheme.caption!.copyWith(fontWeight: FontWeight.bold)),
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
        ],
      ),
    );
  }
}
