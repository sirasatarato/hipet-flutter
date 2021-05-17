import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hipet/src/model/post_model.dart';

class HomeContentController extends GetxController {
  var _posts = <Post>[].obs;

  // ignore: invalid_use_of_protected_member
  List<String> getPostMedia() => _posts.value.map((e) => e.media).toList();

  void getPosts() async {
    BaseOptions options = BaseOptions(
      contentType: Headers.jsonContentType,
      headers: {'firebaseToken': ''},
    );

    Dio dio = Dio(options)..interceptors.add(LogInterceptor());
    var response = await dio.get('/api/post');
    if(response.statusCode == 200) {
      _posts.value = (jsonDecode(response.data) as List).map((e) => Post.fromJson(e)).toList();
    }
  }
}