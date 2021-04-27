import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/topic_controller.dart';
import 'package:hipet/src/util/pair.dart';
import 'package:hipet/src/widgets/pickable_topic.dart';
import 'package:hipet/src/widgets/widest_button.dart';

import 'join_fin_page.dart';

class PickTopicPage extends StatelessWidget {
  final TopicController _topicController = Get.put(TopicController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 6;
    _topicController.topics = [
      Pair('강아지', false),
      Pair('강아지', true),
      Pair('강아지', true),
      Pair('강아지', false),
    ];

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () => Get.to(() => JoinFinPage()),
                    child: Text(
                      '다음에 선택하기',
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: Theme.of(context).accentColor,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '좋아하는 동물을 선택해주세요.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width),
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
                        stops: [0, 0, 0.98, 1.0], // 10% purple, 80% transparent, 10% purple
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: GridView.count(
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 32),
                child: GestureDetector(
                  onTap: () => Get.to(() => JoinFinPage()),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 48,
                    child: WidestButton('다 골랐어요!', isColored: _topicController.isAnyClicked()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
