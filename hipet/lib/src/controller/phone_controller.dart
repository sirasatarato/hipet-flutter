import 'package:get/get.dart';

class PhoneController extends GetxController {
  var _isSubmittedPhoneNumber = false.obs;
  var _isValid = false.obs;

  bool get isSubmittedPhoneNumber => _isSubmittedPhoneNumber.value;
  set isSubmittedPhoneNumber(bool value) => _isSubmittedPhoneNumber.value = value;

  bool get isValid => _isValid.value;
  set isValid(bool value) => _isValid.value = value;
}