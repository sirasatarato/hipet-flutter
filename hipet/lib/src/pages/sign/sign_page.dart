import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/pages/sign/sign_process_frame.dart';
import 'package:hipet/src/widgets/logo.dart';
import 'package:hipet/src/widgets/widest_button.dart';

// ignore: must_be_immutable
class SignPage extends StatelessWidget {
  final bool isLogin;
  late ThemeData _theme;

  SignPage(this.isLogin);

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: buildColumn(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Logo(),
        WidestButton(
          '전화번호로 ' + (isLogin ? '계속 진행' : '가입'),
          imageAsset: 'assets/icon/ic_person.png',
          clickEvent: () => Get.to(() => SignProcessFrame()),
        ),
        const WidestButton('카카오톡으로 계속 진행', imageAsset: 'assets/icon/ic_KakaoTalk.png'),
        const WidestButton('네이버로 계속 진행', imageAsset: 'assets/icon/ic_naver.png'),
        const WidestButton('트위터로 계속 진행', imageAsset: 'assets/icon/ic_twitter.png'),
        const WidestButton('구글로 계속 진행', imageAsset: 'assets/icon/ic_Google.png'),
        const WidestButton('페이스북으로 계속 진행', imageAsset: 'assets/icon/ic_facebook.png'),
        const SizedBox(),
        buildSignBottom(),
      ],
    );
  }

  Row buildSignBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? '계정이 없으세요?' : '이미 계정이 있으신가요?',
          style: _theme.textTheme.bodyText1,
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {},
          child: Text(
            isLogin ? '가입하기' : '로그인',
            style: _theme.textTheme.button!.copyWith(color: _theme.accentColor),
          ),
        ),
      ],
    );
  }
}
