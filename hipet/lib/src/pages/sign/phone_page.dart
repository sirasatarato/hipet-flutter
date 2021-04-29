import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/phone_controller.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class PhonePage extends StatelessWidget {
  final RegExp phoneNumberPattern = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  final PhoneController phoneController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }

  TextFormField buildInputPhoneNumber() {
    return TextFormField(
      validator: (value) => phoneNumberPattern.hasMatch(value!.split('-').reduce((a, b) => a + b)) ? null : '',
      onFieldSubmitted: (value) {
        if (value.isNotEmpty && phoneNumberPattern.hasMatch(value.split('-').reduce((a, b) => a + b))) {
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
                        phoneController.isValid = true;
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
                  onPressed: () {},
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

  GetBuilder<SignUpNavController> buildBottomButton() {
    return GetBuilder(
      builder: (SignUpNavController navController) {
        return Obx(
          () => WidestButton(
            '본인 인증',
            isColored: phoneController.isValid,
            clickEvent: () => navController.nextPage(),
          ),
        );
      },
    );
  }
}
