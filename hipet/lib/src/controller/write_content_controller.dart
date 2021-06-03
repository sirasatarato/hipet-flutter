import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:hipet/src/controller/user_info_controller.dart';
import 'package:hipet/src/mixin/api_core.dart';

class WriteContentController extends getx.GetxController with ApiCore {
  Future<void> getImage(String imageUrl) async {
    // if(imageUrl.isNotEmpty) await dio.get('api/loadimage/$imageUrl');
  }

  Future<bool> uploadImage(String imageUrl, String name) async {
    try {
      var formData = FormData.fromMap({
        'media': await MultipartFile.fromFile(imageUrl, filename: name),
      });
      var newDio = Dio(BaseOptions(
        baseUrl: 'http://hojoondev.kro.kr:5003/',
        contentType: Headers.formUrlEncodedContentType,
        headers: {'firebaseToken': UserInfoController.firebaseToken},
      ));

      await newDio.post('api/media', data: formData);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> writePost(String name, String description) async {
    await dio.post('api/post', data: {
      'mediaName': name,
      'description': description,
    });
  }
}