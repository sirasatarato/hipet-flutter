import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content/write_content_controller.dart';
import 'package:video_compress/video_compress.dart';

class CircularImageView extends StatelessWidget {
  final WriteContentController _writeContentController = Get.find();
  final String imageUid;
  final bool fromImage;

  CircularImageView(this.imageUid, {this.fromImage = true});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fromImage ? _writeContentController.getImage(imageUid) : _writeContentController.getVideo(imageUid),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          if (fromImage) {
            return Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey,
                image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(snapshot.data)),
              ),
            );
          } else {
            return FutureBuilder(
              future: VideoCompress.getFileThumbnail((snapshot.data as File).path),
              builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                    image: snapshot.hasData ? DecorationImage(fit: BoxFit.cover, image: FileImage(snapshot.data!)) : null,
                  ),
                );
              },
            );
          }
        }

        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
