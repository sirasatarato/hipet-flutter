import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/phone_controller.dart';
import 'package:hipet/src/pages/sign/pick_topic_page.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class PhonePage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final RegExp phoneNumberPattern = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  final PhoneController phoneController = Get.find();

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(MfgLabs.left),
        iconSize: 16,
        color: Colors.black,
        onPressed: () => Get.back(),
      ),
      title: Text(
        '전화번호로 가입',
        style: Get.textTheme.headline1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
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

  TextFormField buildInputPhoneNumber() {
    return TextFormField(
      controller: _textEditingController,
      validator: (value) => phoneNumberPattern.hasMatch(value!.split('-').reduce((a, b) => a + b)) ? null : '',
      onFieldSubmitted: (value) {
        if (value.isNotEmpty && phoneNumberPattern.hasMatch(value.split('-').reduce((a, b) => a + b))) {
          phoneController.sendPhoneNumber(value);
          phoneController.isSubmittedPhoneNumber = true;
        }
      },
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: '정보를 입력해주세요.',
        errorStyle: TextStyle(height: 0),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.accentColor)),
      ),
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
                    validator: (value) => value?.isEmpty ?? true ? '' : null,
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty && value.length == 6) {
                        phoneController.sendCode(value);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '정보를 입력해주세요.',
                      errorStyle: TextStyle(height: 0),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.accentColor)),
                    ),
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
