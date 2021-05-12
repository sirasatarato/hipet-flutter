import 'package:flutter/material.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/policy_controller.dart';
import 'package:hipet/src/model/sign_type.dart';
import 'package:hipet/src/widgets/policy_check_box.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class PolicyPage extends StatelessWidget {
  final PolicyController _policyController = Get.find();

  PolicyPage(SignType type) {
    print(type);
    _policyController.setNextPage(type);
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(MfgLabs.left),
        iconSize: 16,
        color: Colors.black,
        onPressed: () => Get.back(),
      ),
      title: Text(
        '이용 약관',
        style: Get.textTheme.headline1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: buildContents(),
          ),
          Spacer(),
          Divider(thickness: 2),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                buildAllAgreementCheckBox(),
                buildMessage('“서비스명” 서비스 약관 및 개인정보 보호 정책에 동의하며 최신 내용 및 프로모션 알림을 허용합니다.'),
                buildBottomButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildContents() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PolicyCheckBox('“서비스명” 서비스 이용약관 동의', 0, isAddPolicy: true),
        PolicyCheckBox('“서비스명” 개인정보 수집이용 동의', 1, isAddPolicy: true),
        Column(
          children: [
            PolicyCheckBox('인기 컨텐츠 및 프로모션 알림 (선택)', 2),
            buildMessage(
              '“서비스명” 에서 인기 동영상 및 프로모션에 대한 알림을 받습니다. '
              '언제든지 설정을 검토하고 편집할 수 있습니다. '
              '이러한 유형의 알림을 허용하지 않아도 “서비스명”의 서비스 사용이 제한되지는 않습니다.',
            ),
          ],
        ),
      ],
    );
  }

  Row buildAllAgreementCheckBox() {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: _policyController.getIsAllChecked(),
            onChanged: (v) => _policyController.changeAllBox(v!),
          ),
        ),
        Text('모두 동의'),
      ],
    );
  }

  Padding buildBottomButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Obx(
        () => WidestButton(
          '모두 확인 후 동의합니다.',
          isColored: _policyController.conditionToMoveOn(),
          clickEvent: () {
            if (_policyController.conditionToMoveOn()) {
              Get.to(() => _policyController.nextPage);
            }
          },
        ),
      ),
    );
  }

  Padding buildMessage(String message) {
    return Padding(
      padding: EdgeInsets.only(left: 32),
      child: Text(
        message,
        softWrap: true,
        style: Get.textTheme.subtitle1,
      ),
    );
  }
}
