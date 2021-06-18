import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:hipet/src/controller/user_info_controller.dart';
import 'package:hipet/src/mixin/api_core.dart';
import 'package:hipet/src/model/post_model.dart';
import 'package:hipet/src/model/user_model.dart';

class UserController extends getx.GetxController with ApiCore {
  final _user = UserModel('', '', '', 0, 0).obs;
  final _userPost = <Post>[].obs;

  UserModel? get user => _user.value;

  List<Post> get userPost => _userPost;

  UserController() {
    getMyProfileData();
  }

  void getMyProfileData() async {
    var response = await dio.get('api/auth');
    print(response.data);
    _user.value = UserModel.fromJson(response.data);

    if (response.data['uid'].toString().isNotEmpty) {
      var newDio = Dio(BaseOptions(
        baseUrl: ApiCore.baseUrl,
        contentType: 'multipart/form-data',
        headers: {'firebaseToken': UserInfoController.firebaseToken, 'user': response.data['uid']},
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

      var res = await newDio.get('api/post');
      print(res.data);
      update(_userPost.value = (res.data as List).map((e) => Post.fromJson(e)).toList());
    }
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
}
