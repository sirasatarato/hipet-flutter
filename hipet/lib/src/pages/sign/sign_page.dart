import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/configs/binding.dart';
import 'package:hipet/src/pages/content/main_content_page.dart';
import 'package:hipet/src/pages/sign/sign_process_frame.dart';
import 'package:hipet/src/widgets/logo.dart';
import 'package:hipet/src/widgets/widest_button.dart';

// ignore: must_be_immutable
class SignPage extends StatefulWidget {
  bool isLogin;

  SignPage(this.isLogin);

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
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
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            WidestButton(
              '전화번호로 ' + (widget.isLogin ? '계속 진행' : '가입'),
              imageAsset: 'assets/icon/ic_person.png',
              clickEvent: () => widget.isLogin ? Get.to(MainContentPage()) : Get.to(() => SignProcessFrame(), binding: SignBinding()),
            ),
            ...widgetButtons,
            const SizedBox(),
            buildSignBottom(),
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
          widget.isLogin ? '계정이 없으세요?' : '이미 계정이 있으신가요?',
          style: Get.textTheme.bodyText1,
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.isLogin = !widget.isLogin;
            });
          },
          child: Text(
            widget.isLogin ? '가입하기' : '로그인',
            style: Get.textTheme.button!.copyWith(color: Get.theme.accentColor),
          ),
        ),
      ],
    );
  }
}
