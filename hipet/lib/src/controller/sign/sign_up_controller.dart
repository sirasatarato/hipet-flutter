import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../user_info_controller.dart';

class SignUpController extends getx.GetxController {
  Future<bool> signUpApi(String survey) async {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://hojoondev.kro.kr:5003',
      contentType: Headers.jsonContentType,
      headers: {'firebaseToken': UserInfoController.firebaseToken},
    );

    try {
      Dio dio = Dio(options);
      dio.interceptors.add(LogInterceptor());

      var response = await dio.post('/api/auth', data: {'survey': survey});
      return response.statusCode == 201;
    } on DioError catch (e) {
      var data = e.response!.data;
      print('errorMessage: ${data['errorMessage']}');
      print('errorCode: ${data['errorCode']}');
      print('errorDescription: ${data['errorDescription']}');
      return false;
    }
  }
}
