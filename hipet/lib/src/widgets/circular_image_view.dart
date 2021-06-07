import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content/write_content_controller.dart';

class CircularImageView extends StatelessWidget {
  final WriteContentController _writeContentController = Get.find();
  final String imageUid;

  CircularImageView(this.imageUid);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _writeContentController.getImage(imageUid),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey,
            image: snapshot.hasData ? DecorationImage(fit: BoxFit.cover, image: MemoryImage(snapshot.data)) : null,
          ),
        );
      },
    );
  }
}
