import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hipet/src/util/database_helper.dart';

class UserInfoController extends GetxController {
  static var firebaseToken = DatabaseHelper().firebaseToken;
  final auth = FirebaseAuth.instance;

  static void saveToken(String token) {
    firebaseToken = token;
    DatabaseHelper().firebaseToken = token;
    print('currentToken is $token');
  }

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      saveToken(googleAuth.idToken!);
    } catch (e) {
      e.printError();
      Fluttertoast.showToast(msg: '구글 로그인 실패하셨습니다.');
      Get.back();
    }
  }

  static void signOutWithGoogle() async {
    if(GoogleSignIn().currentUser != null) {
      await GoogleSignIn().signOut();
      saveToken('');
    }
  }
}
