import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager _instance = SharedPreferencesManager._internal();
  SharedPreferencesManager._internal();

  factory SharedPreferencesManager() => _instance;

  late SharedPreferences preferences;

  String get firebaseToken => preferences.getString('firebaseToken') ?? '';

  set firebaseToken(String value) => preferences.setString('firebaseToken', value);

  bool get isLogin => preferences.getBool('login') ?? false;

  set isLogin(bool value) => preferences.setBool('login', value);

  bool get notification => preferences.getBool('notification') ?? false;

  set notification(bool value) => preferences.setBool('notification', value);
}