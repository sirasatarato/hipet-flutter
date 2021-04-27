import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/policy_controller.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';
import 'package:hipet/src/widgets/policy_check_box.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class PolicyPage extends StatefulWidget {
  @override
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  final SignUpNavController _navController = Get.find();
  final PolicyController _policyController = Get.put(PolicyController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 3;

    return Obx(
      () => Column(
        children: [
          Container(
            height: height,
            padding: const EdgeInsets.all(16),
            child: Column(
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
            ),
          ),
          Spacer(),
          Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _policyController.getIsAllChecked(),
                      onChanged: (v) => _policyController.changeAllBox(v!),
                    ),
                    Text('모두 동의'),
                  ],
                ),
                buildMessage('“서비스명” 서비스 약관 및 개인정보 보호 정책에 동의하며 최신 내용 및 프로모션 알림을 허용합니다.'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
            child: GestureDetector(
              onTap: () {
                if (_policyController.conditionToMoveOn()) _navController.nextPage();
              },
              child: WidestButton('모두 확인 후 동의합니다.', isColored: _policyController.conditionToMoveOn()),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Text(
        message,
        softWrap: true,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
