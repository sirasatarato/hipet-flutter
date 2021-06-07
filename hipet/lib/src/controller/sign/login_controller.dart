import 'package:get/get.dart';
import 'package:hipet/src/util/database_helper.dart';

class LoginController extends GetxController {
  Rx<bool> _isLogin = false.obs;

  bool get isLogin => _isLogin.value;

  set isLogin(bool value) {
    DatabaseHelper().isLogin = value;
    _isLogin.value = value;
  }

  void switchIsLogin() => _isLogin.value = !_isLogin.value;
}
