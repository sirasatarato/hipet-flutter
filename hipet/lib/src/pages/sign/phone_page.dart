import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/phone_controller.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';
import 'package:hipet/src/widgets/widest_button.dart';

// ignore: must_be_immutable
class PhonePage extends StatelessWidget {
  late ThemeData _theme;
  final _formKey = GlobalKey<FormState>();
  RegExp phoneNumberPattern = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  PhoneController phoneController = Get.put(PhoneController());

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Padding(
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
        border: OutlineInputBorder(borderSide: BorderSide(color: _theme.accentColor)),
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
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: _theme.accentColor),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '재발송',
                    style: _theme.textTheme.button!.copyWith(color: _theme.accentColor),
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
        return Obx(() => WidestButton(
              '본인 인증',
              isColored: phoneController.isValid,
              clickEvent: () {
                if (_formKey.currentState?.validate() ?? false) navController.nextPage();
              },
            ));
      },
    );
  }
}
