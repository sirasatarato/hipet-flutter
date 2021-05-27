import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/configs/binding.dart';
import 'package:hipet/src/controller/login_controller.dart';
import 'package:hipet/src/controller/user_info_controller.dart';
import 'package:hipet/src/model/sign_type.dart';
import 'package:hipet/src/pages/content/main_content_page.dart';
import 'package:hipet/src/pages/sign/policy_page.dart';
import 'package:hipet/src/widgets/logo.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class SignPage extends StatelessWidget {
  static final UserInfoController _userInfoController = Get.find();
  static final LoginController _loginController = Get.find();

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
            ...List.generate(4, (index) => SizedBox()),
            Obx(
              () => WidestButton(
                '전화번호로 ' + (_loginController.isLogin ? '계속 진행' : '가입'),
                imageAsset: 'assets/icon/ic_person.png',
                clickEvent: () => clickLoginEvent(SignType.PHONE),
              ),
            ),
            WidestButton(
              '구글로 계속 진행',
              imageAsset: 'assets/icon/ic_Google.png',
              clickEvent: () {
                _userInfoController.signInWithGoogle();
                clickLoginEvent(SignType.GOOGLE);
              },
            ),
            WidestButton(
              '페이스북으로 계속 진행',
              imageAsset: 'assets/icon/ic_facebook.png',
              clickEvent: () {
                _userInfoController.signInWithFacebook();
                clickLoginEvent(SignType.FACEBOOK);
              },
            ),
            Obx(() => buildSignBottom()),
          ],
        ),
      ),
    );
  }

  void clickLoginEvent(SignType type) {
    if (_loginController.isLogin) {
      Get.to(() => MainContentPage());
    } else {
      Get.to(() => PolicyPage(type), binding: SignBinding());
    }
  }

  Row buildSignBottom() {
    bool isLogin = _loginController.isLogin;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? '계정이 없으세요?' : '이미 계정이 있으신가요?',
          style: Get.textTheme.bodyText1,
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: _loginController.switchIsLogin,
          child: Text(
            isLogin ? '가입하기' : '로그인',
            style: Get.textTheme.button!.copyWith(color: Get.theme.accentColor),
          ),
        ),
      ],
    );
  }
}
