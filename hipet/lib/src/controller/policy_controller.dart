import 'package:get/get.dart';

class PolicyController extends GetxController {
  final _isChecked = <bool>[false, false, false].obs;

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
}
