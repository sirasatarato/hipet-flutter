import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/pages/sign/sign_process_frame.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class SignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/logo/logo.png',
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
              GestureDetector(
                onTap: () => Get.to(() => SignProcessFrame()),
                child: WidestButton('전화번호로 가입', imageAsset: 'assets/icon/ic_person.png'),
              ),
              WidestButton('카카오톡으로 계속 진행', imageAsset: 'assets/icon/ic_KakaoTalk.png'),
              WidestButton('네이버로 계속 진행', imageAsset: 'assets/icon/ic_naver.png'),
              WidestButton('트위터로 계속 진행', imageAsset: 'assets/icon/ic_twitter.png'),
              WidestButton('구글로 계속 진행', imageAsset: 'assets/icon/ic_Google.png'),
              WidestButton('페이스북으로 계속 진행', imageAsset: 'assets/icon/ic_facebook.png'),
              SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '이미 계정이 있으신가요?',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      '로그인',
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: Theme.of(context).accentColor,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
