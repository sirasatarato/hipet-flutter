import 'package:get/get.dart';
import 'package:hipet/src/controller/phone_controller.dart';
import 'package:hipet/src/controller/policy_controller.dart';
import 'package:hipet/src/controller/sign_up_nav_controller.dart';
import 'package:hipet/src/controller/topic_controller.dart';

class SignBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpNavController>(() => SignUpNavController());
    Get.lazyPut<PolicyController>(() => PolicyController());
    Get.lazyPut<PhoneController>(() => PhoneController());
    Get.lazyPut<TopicController>(() => TopicController());
  }
}
