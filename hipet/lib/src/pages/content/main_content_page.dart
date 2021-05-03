import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content_nav_controller.dart';
import 'package:hipet/src/pages/content/like_page.dart';
import 'package:hipet/src/pages/content/my_profile_page.dart';

import 'home_page.dart';

class MainContentPage extends StatelessWidget {
  final _contentNavController = Get.put(ContentNavController());

  final List<Widget> bodyContent = [
    HomePage(),
    LikePage(),
    MyProfilePage(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => bodyContent[_contentNavController.selectedIndex]),
      bottomNavigationBar: Obx(
          () => BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) => _contentNavController.selectedIndex = index,
          currentIndex: _contentNavController.selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon/svg/home.svg'),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon/svg/like_lib.svg'),
              label: '좋아요',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon/svg/profile.svg'),
              label: '마이',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon/svg/upload.svg'),
              label: '업로드',
            ),
          ],
        ),
      ),
    );
  }
}

