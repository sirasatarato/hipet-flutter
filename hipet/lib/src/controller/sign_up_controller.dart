import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class SignUpController extends getx.GetxController {
  Future<bool> signUpApi(String survey) async {
    BaseOptions options = BaseOptions(
      contentType: Headers.jsonContentType,
      headers: {'firebaseToken': ''},
    );

    Dio dio = Dio(options)..interceptors.add(LogInterceptor());
    var response = await dio.post('/api/auth', data: {'survey': survey});
    return response.statusCode == 201;
  }
}
