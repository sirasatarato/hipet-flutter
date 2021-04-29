import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/topic_controller.dart';
import 'package:hipet/src/util/pair.dart';
import 'package:hipet/src/widgets/pickable_topic.dart';
import 'package:hipet/src/widgets/widest_button.dart';

import 'join_fin_page.dart';

class PickTopicPage extends StatelessWidget {
  final TopicController _topicController = Get.find();

  @override
  Widget build(BuildContext context) {
    _topicController.topics = [
      Pair('강아지', false),
      Pair('강아지', true),
      Pair('강아지', true),
      Pair('강아지', false),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(16),
              child: buildSkipPage(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text('좋아하는 동물을 선택해주세요.', style: Get.textTheme.bodyText1),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 6),
                child: buildPickableListView(Get.width / 6),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 32),
              child: SizedBox(
                width: Get.width - 80,
                height: 48,
                child: buildBottomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSkipPage() {
    return GestureDetector(
      onTap: () => Get.to(() => JoinFinPage()),
      child: Text(
        '다음에 선택하기',
        style: Get.textTheme.button!.copyWith(color: Get.theme.accentColor),
      ),
    );
  }

  Widget buildPickableListView(double width) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
          stops: [0, 0, 0.98, 1.0], // 10% purple, 80% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Obx(
        () => GridView.count(
          mainAxisSpacing: 36,
          crossAxisSpacing: width,
          crossAxisCount: 2,
          children: _topicController.topics.asMap().entries.map((e) {
            var val = e.value;
            return GestureDetector(
              onTap: () => _topicController.changeSelectTopic(e.key),
              child: PickableTopic(val.left, val.right),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildBottomButton() {
    return Obx(
      () => WidestButton(
        '다 골랐어요!',
        isColored: _topicController.isAnyClicked(),
        clickEvent: () {
          if(_topicController.isAnyClicked()) Get.to(() => JoinFinPage());
        },
      ),
    );
  }
}
