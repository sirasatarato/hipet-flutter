import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hipet/src/util/sharedpreferences_manager.dart';

class UserInfoController extends GetxController {
  final auth = FirebaseAuth.instance;
  static var firebaseToken = SharedPreferencesManager().firebaseToken;

  static void saveToken(String token) {
    firebaseToken = token;
    SharedPreferencesManager().firebaseToken = token;
    print('currentToken is $token');
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    saveToken(googleAuth.idToken!);
  }

  void signInWithFacebook() async {
    final LoginResult login = await FacebookAuth.instance.login();
    final facebookAuthCredential = FacebookAuthProvider.credential(login.accessToken!.token);
    saveToken(facebookAuthCredential.idToken!);
  }
}
