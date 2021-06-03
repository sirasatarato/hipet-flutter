import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/write_content_controller.dart';

class CircularImageView extends StatelessWidget {
  final WriteContentController _writeContentController = Get.find();
  final String imageUrl;

  CircularImageView(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _writeContentController.getImage(imageUrl),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey,
            // image: imageUrl.isNotEmpty ? DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl)) : null,
          ),
        );
      },
    );
  }
}
