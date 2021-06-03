import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content_api_controller.dart';
import 'package:hipet/src/mixin/appbar_maker.dart';
import 'package:hipet/src/pages/content/my_profile_edit_page.dart';
import 'package:hipet/src/widgets/circular_image_view.dart';
import 'package:hipet/src/widgets/edit_button.dart';

class MyProfilePage extends StatelessWidget with AppbarMaker {
  final ContentApiController _contentApiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithNotification('마이페이지'),
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

  SliverAppBar buildHeader() {
    return SliverAppBar(
      expandedHeight: Get.height / 6,
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 16, 24),
        child: Row(
          children: [
            CircularImageView(_contentApiController.user?.profileImg ?? ''),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    _contentApiController.user?.name ?? '',
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
