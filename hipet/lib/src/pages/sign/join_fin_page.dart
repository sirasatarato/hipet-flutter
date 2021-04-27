import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/pages/sign/sign_page.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class JoinFinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(flex: 2),
          Image.asset(
            'assets/icon/logo/logo.png',
            fit: BoxFit.cover,
            width: 120,
            height: 120,
          ),
          Spacer(flex: 1),
          Text(
            '“서비스명” 에 가입이 완료되었어요!\n귀여운 동물 친구들을\n보러갈까요? :)',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 3),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
            child: GestureDetector(
              onTap: () => Get.offAll(() => SignPage()),
              child: Container(
                width: MediaQuery.of(context).size.width - 80,
                height: 48,
                child: WidestButton('확인', isColored: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
