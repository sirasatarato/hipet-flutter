import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class PolicyPage extends StatefulWidget {
  @override
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  final SignUpNavController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildRow('“서비스명” 서비스 이용약관 동의'),
              buildRow('“서비스명” 개인정보 수집이용 동의'),
              Column(
                children: [
                  buildRow('인기 컨텐츠 및 프로모션 알림 (선택)', addSeePolicy: false),
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
              buildRow('모두 동의', addSeePolicy: false),
              buildMessage('“서비스명” 서비스 약관 및 개인정보 보호 정책에 동의하며 최신 내용 및 프로모션 알림을 허용합니다.'),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () => _controller.nextPage(),
                child: WidestButton('모두 확인 후 동의합니다.'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildRow(String title, {bool addSeePolicy = true}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icon/svg/check.svg',
          color: Theme.of(context).accentColor,
        ),
        Text(title),
        Spacer(),
        if (addSeePolicy)
          Text(
            '약관보기',
            style: Theme.of(context).textTheme.caption,
          ),
      ],
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
