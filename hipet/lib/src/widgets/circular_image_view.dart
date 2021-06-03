import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content_api_controller.dart';

class CircularImageView extends StatelessWidget {
  final ContentApiController _contentApiController = Get.find();
  final String imageUrl;

  CircularImageView(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _contentApiController.getImage(imageUrl),
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
