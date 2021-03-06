import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content/write_content_controller.dart';
import 'package:hipet/src/pages/content/write_post_page.dart';
import 'package:hipet/src/widgets/back_key.dart';

class SelectVideoPage extends StatelessWidget {
  final WriteContentController _writeContentController  = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackKey(color: Colors.white),
        elevation: 0,
      ),
      backgroundColor: Color(0xFF1B1B29),
      body: Center(
        child: GestureDetector(
          onTap: selectVideo,
          child: Container(
            width: Get.width / 2,
            height: Get.width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey,
            ),
            child: Center(
              child: Text(
                '동영상 촬영\nor\n앨범 선택',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void selectVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result != null && result.files.single.path != null) {
      var path = result.files.single.path!;
      var uid = await _writeContentController.uploadMedia(path);
      if(uid.isNotEmpty) {
        Get.off(() => WritePostPage(path, uid));
      } else {
        Get.back();
      }
    }
  }
}
