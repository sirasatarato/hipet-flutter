import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/sign/phone_controller.dart';
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

  bool checkPattern(String value) {
    value = value.replaceAll('-', '');
    return phoneNumberPattern.hasMatch(value) && value.length == 11;
  }

  TextFormField buildInputPhoneNumber() {
    return TextFormField(
      controller: _textEditingController,
      keyboardType: TextInputType.phone,
      decoration: buildInputDecoration('전화번호'),
      onFieldSubmitted: (value) {
        if (checkPattern(value)) phoneController.sendPhoneNumber(value);
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
                ),
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
        clickEvent: () {
          if(phoneController.isValid) Get.to(() => PickTopicPage());
        },
      ),
    );
  }
}
