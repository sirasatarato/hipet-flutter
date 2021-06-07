import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content/user_controller.dart';
import 'package:hipet/src/mixin/appbar_maker.dart';
import 'package:hipet/src/pages/content/my_profile_edit_page.dart';
import 'package:hipet/src/widgets/circular_image_view.dart';
import 'package:hipet/src/widgets/edit_button.dart';
import 'package:hipet/src/widgets/post_grid_view.dart';

class MyProfilePage extends StatelessWidget with AppbarMaker {
  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithNotification('마이페이지'),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [buildHeader()],
        body: PostGridView([]),
      ),
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
            CircularImageView(_userController.user?.profileImg ?? ''),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    _userController.user?.name ?? '',
                    style: Get.textTheme.headline1!.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(height: 16),
                Flexible(child: EditButton(onTap: () => Get.to(() => MyProfileEditPage())))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
