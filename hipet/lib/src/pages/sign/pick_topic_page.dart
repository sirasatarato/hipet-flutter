import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/sign_up_controller.dart';
import 'package:hipet/src/controller/topic_controller.dart';
import 'package:hipet/src/pages/sign/sign_page.dart';
import 'package:hipet/src/widgets/pickable_topic.dart';
import 'package:hipet/src/widgets/widest_button.dart';

import 'join_fin_page.dart';

class PickTopicPage extends StatelessWidget {
  final TopicController _topicController = Get.find();
  final SignUpController _signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                child: buildPickableListView(),
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
      onTap: () => selectCompleteEvent('00000000'),
      child: Text(
        '다음에 선택하기',
        style: Get.textTheme.button!.copyWith(color: Get.theme.accentColor),
      ),
    );
  }

  Widget buildPickableListView() {
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
          crossAxisSpacing: Get.width / 6,
          crossAxisCount: 2,
          children: _topicController.topics.asMap().entries.map((e) {
            return GestureDetector(
              onTap: () => _topicController.changeSelectTopic(e.key),
              child: PickableTopic(e.value),
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
          if (_topicController.isAnyClicked()) {
            selectCompleteEvent(_topicController.binaryTopics());
          }
        },
      ),
    );
  }

  void selectCompleteEvent(String survey) async {
    bool isSuccess = await _signUpController.signUpApi(survey);

    if (isSuccess) {
      Get.to(() => JoinFinPage());
    } else {
      BotToast.showText(text: '회원가입에 실패하였습니다. 다시 시도해주시길 바랍니다.');
      Get.offAll(() => SignPage());
    }
  }
}
