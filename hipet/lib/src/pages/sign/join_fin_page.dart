import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/sign/login_controller.dart';
import 'package:hipet/src/pages/sign/sign_page.dart';
import 'package:hipet/src/widgets/logo.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class JoinFinPage extends StatelessWidget {
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 2),
          const Logo(),
          const Spacer(flex: 1),
          Text(
            '“서비스명” 에 가입이 완료되었어요!\n귀여운 동물 친구들을\n보러갈까요? :)',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 3),
          buildFinishButton(context),
        ],
      ),
    );
  }

  Padding buildFinishButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
      child: Container(
        width: Get.width - 80,
        height: 48,
        child: WidestButton(
          '확인',
          isColored: true,
          clickEvent: () {
            _loginController.isLogin = true;
            Get.offAll(() => SignPage());
          },
        ),
      ),
    );
  }
}
