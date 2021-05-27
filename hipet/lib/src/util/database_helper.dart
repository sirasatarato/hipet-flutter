import 'package:hive/hive.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Box signBox = Hive.box('sign');
  Box contentBox = Hive.box('content');

  String get firebaseToken => contentBox.get('firebaseToken') ?? '';

  set firebaseToken(String value) => contentBox.put('firebaseToken', value);

  bool get isLogin => signBox.get('login') ?? false;

  set isLogin(bool value) => signBox.put('login', value);

  bool get notification => signBox.get('notification') ?? false;

  set notification(bool value) => signBox.put('notification', value);
}
