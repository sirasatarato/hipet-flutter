import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hipet/src/widgets/circular_image_view.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [buildHeader()],
        body: GridView.count(
          childAspectRatio: 3 / 5,
          crossAxisCount: 3,
          children: [],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Text(
        '마이페이지',
        style: Get.textTheme.headline1!.copyWith(color: Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SvgPicture.asset('assets/icon/svg/bell.svg'),
        )
      ],
    );
  }

  SliverAppBar buildHeader() {
    return SliverAppBar(
      expandedHeight: Get.height / 6,
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 16, 24),
        child: Row(
          children: [
            CircularImageView(''),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildUserName(),
                SizedBox(height: 16),
                buildEditButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Flexible buildUserName() {
    return Flexible(
      child: Text(
        '밥을 많이 먹는 요요',
        style: Get.textTheme.headline1!.copyWith(color: Colors.white),
      ),
    );
  }

  Flexible buildEditButton() {
    return Flexible(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 36,
          height: 18,
          decoration: BoxDecoration(
            color: Get.theme.accentColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              'edit',
              style: Get.textTheme.caption!.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
