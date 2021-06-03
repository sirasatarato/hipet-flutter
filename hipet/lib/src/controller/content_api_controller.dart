import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart' as Get;
import 'package:hipet/src/controller/user_info_controller.dart';
import 'package:hipet/src/model/user_model.dart';

class ContentApiController extends Get.GetxController {
  final Dio dio = Dio(options)..interceptors.add(LogInterceptor());
  static final BaseOptions options = BaseOptions(
    baseUrl: 'http://hojoondev.kro.kr:5003/',
    contentType: Headers.jsonContentType,
    headers: {'firebaseToken': UserInfoController.firebaseToken},
  );

  Get.Rx<UserModel?> _user = UserModel('', '', '', 0, 0).obs;

  UserModel? get user => _user.value;

  ContentApiController() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode != 404) {
            var data = error.response!.data;
            print('errorMessage: ${data['errorMessage']}');
            print('errorCode: ${data['errorCode']}');
            print('errorDescription: ${data['errorDescription']}');

            if (error.response?.statusCode == 412) {
              UserInfoController.saveToken(await reloadCurrentUserForToken());
              Get.Get.back();
            }
          }
        },
      ),
    );

    getMyProfileData();
    // getPosts();
  }

  void getMyProfileData() async {
    var response = await dio.get('api/auth');
    _user.value = UserModel.fromJson(response.data);
  }

  void getPosts() async {
    var response = await dio.get('api/post');
    print(response.data);
  }

  void editUserInfo({String? name, String? profileImage}) async {
    var response = await dio.put('api/auth', data: {
      'name': name ?? user!.name,
      'profileImage': profileImage ?? user!.profileImg,
    });

    if (response.statusCode == 201) {
      _user.value = UserModel(
        name ?? user!.name,
        user!.uid,
        profileImage ?? user!.profileImg,
        user!.follower,
        user!.following,
      );
    }
  }

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

  Future<String> reloadCurrentUserForToken() async {
    User oldUser = FirebaseAuth.instance.currentUser!;
    await oldUser.reload();
    User newUser = FirebaseAuth.instance.currentUser!;
    return await newUser.getIdToken(true);
  }
}
