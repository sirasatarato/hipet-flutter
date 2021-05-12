import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/model/sign_type.dart';
import 'package:hipet/src/pages/sign/phone_page.dart';
import 'package:hipet/src/pages/sign/pick_topic_page.dart';

class PolicyController extends GetxController {
  final _isChecked = <bool>[false, false, false].obs;
  late Widget nextPage;

  // ignore: invalid_use_of_protected_member
  get isChecked => _isChecked.value;

  void changeBox(int index) {
    // ignore: invalid_use_of_protected_member
    List<bool> list = List.from(_isChecked.value);
    list[index] = !list[index];
    _isChecked.value = list;
  }

  // ignore: invalid_use_of_protected_member
  bool conditionToMoveOn() => _isChecked.value[0] && _isChecked.value[1];

  bool getIsAllChecked() => isChecked.where((e) => !e).isEmpty;

  void changeAllBox(bool value) {
    if (value) {
      _isChecked.value = [true, true, true];
    } else {
      _isChecked.value = [false, false, false];
    }
  }

  void setNextPage(SignType type) {
    switch(type) {
      case SignType.PHONE:
        nextPage = PhonePage();
        break;
      case SignType.KAKAO:
      case SignType.NAVER:
      case SignType.TWITTER:
      case SignType.GOOGLE:
      case SignType.FACEBOOK:
        nextPage = PickTopicPage();
    }
  }
}
