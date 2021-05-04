import 'package:get/get.dart';
import 'package:hipet/src/controller/phone_controller.dart';
import 'package:hipet/src/controller/policy_controller.dart';
import 'package:hipet/src/controller/sign_up_controller.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';
import 'package:hipet/src/controller/topic_controller.dart';

class SignBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolicyController>(() => PolicyController(), fenix: true);
    Get.lazyPut<PhoneController>(() => PhoneController(), fenix: true);
    Get.lazyPut<TopicController>(() => TopicController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<SignUpNavController>(() => SignUpNavController(), fenix: true);
  }
}
