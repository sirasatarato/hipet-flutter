import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/phone_controller.dart';
import 'package:hipet/src/mixin/appbar_maker.dart';
import 'package:hipet/src/pages/sign/pick_topic_page.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class PhonePage extends StatelessWidget with AppbarMaker {
  final TextEditingController _textEditingController = TextEditingController();
  final RegExp phoneNumberPattern = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  final PhoneController phoneController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithBackKey('전화번호로 가입'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            const Text('휴대전화 번호'),
            buildInputPhoneNumber(),
            const SizedBox(height: 22),
            buildInputValidNumber(),
            const Spacer(flex: 2),
            buildBottomButton(),
          ],
        ),
      ),
    );
  }

  bool checkPattern(String value) => phoneNumberPattern.hasMatch(value.split('-').reduce((a, b) => a + b));

  TextFormField buildInputPhoneNumber() {
    return TextFormField(
      controller: _textEditingController,
      keyboardType: TextInputType.phone,
      decoration: buildInputDecoration('전화번호'),
      validator: (value) => checkPattern(value!) ? null : ' ',
      onFieldSubmitted: (value) {
        if (value.isNotEmpty && checkPattern(value)) phoneController.sendPhoneNumber(value);
      },
    );
  }

  Widget buildInputValidNumber() {
    return Obx(
      () => Visibility(
        visible: phoneController.isSubmittedPhoneNumber,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('인증 번호'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration('인증코드'),
                    validator: (value) => value?.isEmpty ?? false ? null : ' ',
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty && value.length == 6) phoneController.sendCode(value);
                    },
                  ),
                ),
                TextButton(
                  onPressed: () => phoneController.sendPhoneNumber(_textEditingController.text),
                  child: Text(
                    '재발송',
                    style: Get.textTheme.button!.copyWith(color: Get.theme.accentColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: '$hint를 입력해주세요.',
      errorStyle: TextStyle(height: 0),
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.accentColor)),
    );
  }

  Widget buildBottomButton() {
    return Obx(
      () => WidestButton(
        '본인 인증',
        isColored: phoneController.isValid,
        clickEvent: () => Get.to(() => PickTopicPage()),
      ),
    );
  }
}
