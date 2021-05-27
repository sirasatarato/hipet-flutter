import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/user_info_controller.dart';

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
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(msg: '올바르지 않은 전화번호를 입력하셨습니다.');
        print(e.message);
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        id = verificationId;
        isSubmittedPhoneNumber = true;
        Fluttertoast.showToast(msg: '인증코드가 보내졌습니다.');
      },
      codeAutoRetrievalTimeout: (String verificationId) => () {
        isSubmittedPhoneNumber = false;
        Fluttertoast.showToast(msg: '시간 초과가 되셨습니다. 다시 한 번 인증해 주십시오.');
      },
      timeout: Duration(seconds: 120),
    );
  }

  Future<String?> sendCode(String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: id, smsCode: code);
    var signIn = await auth.signInWithCredential(credential);
    if (signIn.user != null) {
      isValid = true;
      var token = await signIn.user!.getIdToken();
      UserInfoController.saveToken(token);
      return token;
    }
  }
}
