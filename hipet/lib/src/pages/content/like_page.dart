import 'package:flutter/material.dart';
import 'package:hipet/src/mixin/appbar_maker.dart';
import 'package:hipet/src/widgets/post_grid_view.dart';

class LikePage extends StatelessWidget with AppbarMaker {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithNotification('좋아요'),
      body: PostGridView([]),
    );
  }
}
