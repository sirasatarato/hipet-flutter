import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              buildSignButton(null, '전화번호로 가입', () {}),
              buildSignButton('assets/icon/ic_KakaoTalk.png', '카카오톡으로 계속 진행', () {}),
              buildSignButton('assets/icon/ic_naver.png', '네이버로 계속 진행', () {}),
              buildSignButton('assets/icon/ic_twitter.png', '트위터로 계속 진행', () {}),
              buildSignButton('assets/icon/ic_Google.png', '구글로 계속 진행', () {}),
              buildSignButton('assets/icon/ic_facebook.png', '페이스북으로 계속 진행', () {}),
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
                    child: Text('로그인',
                        style: Theme.of(context).textTheme.button!.copyWith(color: Theme.of(context).accentColor)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildSignButton(String? imageAsset, String title, VoidCallback clickLogin) {
    return GestureDetector(
      onTap: clickLogin,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            imageAsset != null
                ? Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                    width: 16,
                    height: 16,
                  )
                : SvgPicture.asset('assets/icon/svg/person.svg'),
            Expanded(
              child: Center(
                child: Builder(
                  builder: (context) => Text(
                    title,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
