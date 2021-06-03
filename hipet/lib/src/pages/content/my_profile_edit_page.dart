import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/user_controller.dart';
import 'package:hipet/src/controller/write_content_controller.dart';
import 'package:hipet/src/widgets/back_key.dart';
import 'package:hipet/src/widgets/circular_image_view.dart';
import 'package:hipet/src/widgets/edit_button.dart';

// ignore: must_be_immutable
class MyProfileEditPage extends StatelessWidget {
  final UserController _userController = Get.find();
  final WriteContentController _writeContentController = Get.find();
  TextEditingController _nicknameEditingController = TextEditingController();
  String filePath = '';

  @override
  Widget build(BuildContext context) {
    _nicknameEditingController = TextEditingController(text: _userController.user?.name);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          GestureDetector(
            onTap: uploadImage,
            child: SizedBox(
              width: Get.width / 2.5,
              height: Get.width / 2.5,
              child: CircularImageView(_userController.user?.profileImg ?? ''),
            ),
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
      onTap: () async {
        if (_nicknameEditingController.text.isNotEmpty) {
          if (filePath.isNotEmpty) {
            _userController.editUserInfo(
                name: _nicknameEditingController.text, profileImage: filePath.split('/').last);
          } else {
            _userController.editUserInfo(name: _nicknameEditingController.text);
          }

          Get.back();
        }
      },
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
          controller: _nicknameEditingController,
          decoration: InputDecoration(
            hintText: '정보를 입력해주세요.',
            border: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.accentColor)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.accentColor)),
          ),
        ),
      ],
    );
  }

  void uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.path != null) {
      var path = result.files.single.path!;
      if(await _writeContentController.uploadImage(path, path.split('/').last)) {
        filePath = path;
      }
    }
  }
}
