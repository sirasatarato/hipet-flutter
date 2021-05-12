import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  SharedPreferences? _preferences;
  Rx<bool> _isLogin = false.obs;

  bool get isLogin => _isLogin.value;

  set isLogin(bool value) {
    saveIsLogin(value);
    _isLogin.value = value;
  }

  void switchIsLogin() {
    _isLogin.value = !_isLogin.value;
  }

  void saveIsLogin(bool value) async {
    _preferences ??= await SharedPreferences.getInstance();
    _preferences!.setBool("login", value);
  }
}
