import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  final firebaseMessaging = FirebaseMessaging.instance;
  static var firebaseToken = '';

  UserInfoController() {
    firebaseMessaging.getToken().then((value) {
      firebaseToken = value!;
      print(firebaseToken);
    });
  }
}
