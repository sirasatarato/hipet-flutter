import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/content/write_content_controller.dart';
import 'package:hipet/src/widgets/back_key.dart';
import 'package:video_player/video_player.dart';

class WritePostPage extends StatefulWidget {
  final String path;

  WritePostPage(this.path);

  @override
  _WritePostPageState createState() => _WritePostPageState();
}

class _WritePostPageState extends State<WritePostPage> {
  final WriteContentController _writeContentController = Get.find();
  final contentTextEditingController = TextEditingController();
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path));
    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackKey(color: Colors.white),
        actions: [
          TextButton(
            onPressed: () {
              _writeContentController.writePost(widget.path.split('/').last, contentTextEditingController.text);
              Get.back();
            },
            child: Text(
              '저장',
              style: Get.textTheme.button!.copyWith(color: Colors.yellow),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying ? _controller.pause() : _controller.play();
                      });
                    },
                    child: VideoPlayer(_controller),
                  ),
                )
              : Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: TextField(
                controller: contentTextEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '피드 내용을 작성하세요.',
                  hintStyle: Get.textTheme.bodyText1!.copyWith(color: Get.theme.accentColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
