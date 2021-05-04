import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/configs/binding.dart';
import 'package:hipet/src/controller/login_controller.dart';
import 'package:hipet/src/pages/content/main_content_page.dart';
import 'package:hipet/src/pages/sign/sign_process_frame.dart';
import 'package:hipet/src/widgets/logo.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class SignPage extends StatelessWidget {
  final LoginController _loginController = Get.find();

  final widgetButtons = const [
    WidestButton('카카오톡으로 계속 진행', imageAsset: 'assets/icon/ic_KakaoTalk.png'),
    WidestButton('네이버로 계속 진행', imageAsset: 'assets/icon/ic_naver.png'),
    WidestButton('트위터로 계속 진행', imageAsset: 'assets/icon/ic_twitter.png'),
    WidestButton('구글로 계속 진행', imageAsset: 'assets/icon/ic_Google.png'),
    WidestButton('페이스북으로 계속 진행', imageAsset: 'assets/icon/ic_facebook.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(),
            Obx(
              () => WidestButton(
                '전화번호로 ' + (_loginController.isLogin ? '계속 진행' : '가입'),
                imageAsset: 'assets/icon/ic_person.png',
                clickEvent: () {
                  if (_loginController.isLogin) {
                    Get.to(() => MainContentPage());
                  } else {
                    Get.to(() => SignProcessFrame(), binding: SignBinding());
                  }
                },
              ),
            ),
            ...widgetButtons,
            const SizedBox(),
            Obx(() => buildSignBottom()),
          ],
        ),
      ),
    );
  }

  Row buildSignBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _loginController.isLogin ? '계정이 없으세요?' : '이미 계정이 있으신가요?',
          style: Get.textTheme.bodyText1,
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () => _loginController.isLogin = !_loginController.isLogin,
          child: Text(
            _loginController.isLogin ? '가입하기' : '로그인',
            style: Get.textTheme.button!.copyWith(color: Get.theme.accentColor),
          ),
        ),
      ],
    );
  }
}
