import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';
import 'package:hipet/src/widgets/widest_button.dart';

class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final SignUpNavController _controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 1),
            Text('휴대전화 번호'),
            TextFormField(
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Enter some text';
                } else
                  return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                hintText: '정보를 입력해주세요.',
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 22),
            Visibility(
              visible: true,
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
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter some text';
                            } else
                              return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                            hintText: '인증번호 6자리',
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '재발송',
                          style: Theme.of(context).textTheme.button!.copyWith(color: Theme.of(context).accentColor),
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
                  _controller.nextPage();
                }
              },
              child: WidestButton('본인 인증'),
            ),
          ],
        ),
      ),
    );
  }
}
