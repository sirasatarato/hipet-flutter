import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/widgets/back_key.dart';
import 'package:hipet/src/widgets/circular_image_view.dart';
import 'package:hipet/src/widgets/edit_button.dart';

class MyProfileEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Center(child: buildSaveButton())],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackKey(),
      ),
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.077),
          SizedBox(
            width: Get.width / 2.5,
            height: Get.width / 2.5,
            child: CircularImageView(''),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: EditButton(),
          ),
          Padding(
            padding: EdgeInsets.all(Get.width * 0.1),
            child: buildNameInput(),
          ),
        ],
      ),
    );
  }

  buildSaveButton() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          '저장',
          style: Get.textTheme.button!.copyWith(
            color: Get.theme.accentColor,
          ),
        ),
      ),
    );
  }

  Wrap buildNameInput() {
    return Wrap(
      children: [
        Text(
          '닉네임',
          style: Get.textTheme.caption!.copyWith(
            color: Get.theme.accentColor,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: '정보를 입력해주세요.',
            border: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.accentColor)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.accentColor)),
          ),
        ),
      ],
    );
  }
}
