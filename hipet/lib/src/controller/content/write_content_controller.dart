import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:hipet/src/controller/user_info_controller.dart';
import 'package:hipet/src/mixin/api_core.dart';

class WriteContentController extends getx.GetxController with ApiCore {
  Future getImage(String imageUrl) async {
    if (imageUrl.isNotEmpty) {
      var response = await dio.get('api/media/$imageUrl');
      return response.data;
    }
  }

  Future<String> uploadMedia(String mediaPath) async {
    try {
      print("uploading...");
      var formData = FormData.fromMap({'media': await MultipartFile.fromFile(mediaPath)});
      var newDio = Dio(BaseOptions(
        baseUrl: 'http://hojoondev.kro.kr:5003/',
        contentType: 'multipart/form-data',
        headers: {'firebaseToken': UserInfoController.firebaseToken},
      ))
        ..interceptors.addAll([
          LogInterceptor(),
          InterceptorsWrapper(
            onError: (error, handler) async {
              if (error.response?.statusCode != 404) {
                var data = error.response!.data;
                print('errorMessage: ${data['errorMessage']}');
                print('errorCode: ${data['errorCode']}');
                print('errorDescription: ${data['errorDescription']}');
              }
            },
          ),
        ]);

      var response = await newDio.post('api/media', data: formData);
      print('success: ${response.data}');
      return response.data['uid'];
    } catch (e) {
      print('failed: $e');
      return '';
    }
  }

  Future<void> writePost(String name, String description) async {
    await dio.post('api/post', data: {
      'mediaName': name,
      'description': description,
    });
  }
}
