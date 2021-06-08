import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart' as getx;
import 'package:hipet/src/controller/user_info_controller.dart';

mixin ApiCore {
  static const baseUrl = 'http://hojoondev.kro.kr:5003/';

  static final BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    contentType: Headers.jsonContentType,
    headers: {'firebaseToken': UserInfoController.firebaseToken},
  );
  final Dio dio = Dio(options)
    ..interceptors.addAll([
      LogInterceptor(),
      InterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode != 404) {
            var data = error.response!.data;
            print('errorMessage: ${data['errorMessage']}');
            print('errorCode: ${data['errorCode']}');
            print('errorDescription: ${data['errorDescription']}');

            if (error.response?.statusCode == 412) {
              UserInfoController.saveToken(await reloadCurrentUserForToken());
              getx.Get.back();
            }
          }
        },
      ),
    ]);

  static Future<String> reloadCurrentUserForToken() async {
    User oldUser = FirebaseAuth.instance.currentUser!;
    await oldUser.reload();
    User newUser = FirebaseAuth.instance.currentUser!;
    return await newUser.getIdToken(true);
  }
}
