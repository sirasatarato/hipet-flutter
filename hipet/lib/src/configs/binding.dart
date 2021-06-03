import 'package:get/get.dart';
import 'package:hipet/src/controller/user_controller.dart';
import 'package:hipet/src/controller/phone_controller.dart';
import 'package:hipet/src/controller/policy_controller.dart';
import 'package:hipet/src/controller/post_controller.dart';
import 'package:hipet/src/controller/sign_up_controller.dart';
import 'package:hipet/src/controller/topic_controller.dart';
import 'package:hipet/src/controller/write_content_controller.dart';

class SignBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolicyController>(() => PolicyController(), fenix: true);
    Get.lazyPut<PhoneController>(() => PhoneController(), fenix: true);
    Get.lazyPut<TopicController>(() => TopicController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
  }
}

class ContentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController());
    Get.put<PostController>(PostController());
    Get.put<WriteContentController>(WriteContentController());
  }
}