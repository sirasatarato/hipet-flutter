import 'package:get/get.dart' as getx;
import 'package:hipet/src/mixin/api_core.dart';
import 'package:hipet/src/model/user_model.dart';

class UserController extends getx.GetxController with ApiCore {
  getx.Rx<UserModel?> _user = UserModel('', '', '', 0, 0).obs;

  UserModel? get user => _user.value;

  UserController() {
    getMyProfileData();
  }

  void getMyProfileData() async {
    var response = await dio.get('api/auth');
    _user.value = UserModel.fromJson(response.data);
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
