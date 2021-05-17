import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PhoneController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var id = '';
  var _isSubmittedPhoneNumber = false.obs;
  var _isValid = false.obs;

  bool get isSubmittedPhoneNumber => _isSubmittedPhoneNumber.value;

  set isSubmittedPhoneNumber(bool value) => _isSubmittedPhoneNumber.value = value;

  bool get isValid => _isValid.value;

  set isValid(bool value) => _isValid.value = value;

  sendPhoneNumber(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+82 $phone',
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) => print(e.message),
      codeSent: (String verificationId, int? forceResendingToken) => id = verificationId,
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: Duration(seconds: 120),
    );
  }

  Future<String?> sendCode(String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: id, smsCode: code);
    var signIn = await auth.signInWithCredential(credential);
    if (signIn.user != null) {
      isValid = true;
      return await signIn.user!.getIdToken();
    }
  }
}
