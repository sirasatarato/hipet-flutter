import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/util/sharedpreferences_manager.dart';

class PolicyController extends GetxController {
  final _isChecked = [false, false, false].obs;
  late Widget nextPage;

  get isChecked => _isChecked;

  void changeBox(int index) {
    List<bool> list = List.from(_isChecked);
    list[index] = !list[index];
    _isChecked.value = list;
  }

  bool conditionToMoveOn() => _isChecked[0] && _isChecked[1];

  bool getIsAllChecked() => isChecked.where((e) => !e).isEmpty;

  void changeAllBox(bool value) => _isChecked.value = [value, value, value];

  void savePolicy() => SharedPreferencesManager().notification = _isChecked.last;
}
