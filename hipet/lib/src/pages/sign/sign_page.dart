import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hipet/src/configs/binding.dart';
import 'package:hipet/src/controller/user_info_controller.dart';
import 'package:hipet/src/mixin/api_core.dart';
import 'package:hipet/src/model/sign_type.dart';
import 'package:hipet/src/pages/content/main_content_page.dart';
import 'package:hipet/src/pages/sign/policy_page.dart';
import 'package:hipet/src/widgets/logo.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class SignPage extends StatelessWidget {
  final UserInfoController _userInfoController = Get.find();
  final isLogin = UserInfoController.firebaseToken.isNotEmpty.obs;

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
            for (var i = 0; i < 5; i++) SizedBox(),
            Obx(
              () => WidestButton(
                '전화번호로 ' + (isLogin.value ? '계속 진행' : '가입'),
                imageAsset: 'assets/icon/ic_person.png',
                clickEvent: () => clickLoginEvent(SignType.PHONE),
              ),
            ),
            WidestButton(
              '구글로 계속 진행',
              imageAsset: 'assets/icon/ic_Google.png',
              clickEvent: () {
                clickLoginEvent(SignType.GOOGLE);
              },
            ),
            Obx(() => buildSignBottom()),
          ],
        ),
      ),
    );
  }

  void clickLoginEvent(SignType type) {
    if (isLogin.value) {
      if (UserInfoController.firebaseToken.isNotEmpty) {
        Get.to(
          () {
            ApiCore.reloadCurrentUserForToken().then((value) {
              UserInfoController.saveToken(value);
              Get.to(() => MainContentPage(), binding: ContentBinding());
            });

            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      } else {
        Fluttertoast.showToast(msg: '로그인이 안 되어 있습니다. 회원 가입해주시길 바랍니다.');
      }
    } else {
      if (type == SignType.GOOGLE) _userInfoController.signInWithGoogle();
      Get.to(() => PolicyPage(type), binding: SignBinding());
    }
  }

  Row buildSignBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin.value ? '계정이 없으세요?' : '이미 계정이 있으신가요?',
          style: Get.textTheme.bodyText1,
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () => isLogin.value = !isLogin.value,
          child: Text(
            isLogin.value ? '가입하기' : '로그인',
            style: Get.textTheme.button!.copyWith(color: Get.theme.accentColor),
          ),
        ),
      ],
    );
  }
}
