import 'package:get/get.dart';
import 'package:hipet/src/util/sharedpreferences_manager.dart';

class LoginController extends GetxController {
  Rx<bool> _isLogin = false.obs;

  bool get isLogin => _isLogin.value;

  set isLogin(bool value) {
    SharedPreferencesManager().isLogin = value;
    _isLogin.value = value;
  }

  void switchIsLogin() {
    _isLogin.value = !_isLogin.value;
  }
}
