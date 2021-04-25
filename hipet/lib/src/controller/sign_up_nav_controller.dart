import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/pages/sign/phone_page.dart';
import 'package:hipet/src/pages/sign/pick_topic_page.dart';
import 'package:hipet/src/pages/sign/policy_page.dart';
import 'package:hipet/src/util/pair.dart';

class SignUpNavController extends GetxController {
  final pages = [
    Pair('이용 약관', PolicyPage()),
    Pair('전화번호로 가입', PhonePage()),
  ];

  RxInt _currentPageNumber = 0.obs;

  get currentPageNumber => _currentPageNumber.value;

  void nextPage() {
    if(_currentPageNumber.value < pages.length - 1) {
      _currentPageNumber.value++;
    } else {
      Get.to(PickTopicPage());
    }
  }

  void backPage() {
    if(_currentPageNumber.value == 0) {
      Get.back();
    } else {
      _currentPageNumber.value--;
    }
  }

  String getTitle() => pages[_currentPageNumber.value].left;

  Widget getPage() => pages[_currentPageNumber.value].right;
}
