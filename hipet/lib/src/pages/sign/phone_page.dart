import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/phone_controller.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';
import 'package:hipet/src/widgets/widest_button.dart';

// ignore: must_be_immutable
class PhonePage extends StatelessWidget {
  late SignUpNavController _navController = Get.find();

  final _formKey = GlobalKey<FormState>();
  RegExp phoneNumberPattern = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PhoneController(),
      builder: (PhoneController phoneController) {
        return Obx(
          () => Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1),
                  Text('휴대전화 번호'),
                  TextFormField(
                    validator: (value) => phoneNumberPattern.hasMatch(value!.split('-').reduce((a, b) => a + b)) ? null : '',
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty && phoneNumberPattern.hasMatch(value.split('-').reduce((a, b) => a + b))) {
                        phoneController.isSubmittedPhoneNumber = true;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '정보를 입력해주세요.',
                      errorStyle: TextStyle(height: 0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).accentColor),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 22),
                  Visibility(
                    visible: phoneController.isSubmittedPhoneNumber,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('인증 번호'),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
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
                                    borderSide: BorderSide(color: Theme.of(context).accentColor),
                                  ),
                                ),
                                maxLength: 6,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '재발송',
                                style:
                                    Theme.of(context).textTheme.button!.copyWith(color: Theme.of(context).accentColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 2),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _navController.nextPage();
                      }
                    },
                    child: WidestButton('본인 인증', isColored: phoneController.isValid),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
