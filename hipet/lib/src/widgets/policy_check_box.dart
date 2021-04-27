import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/policy_controller.dart';

// ignore: must_be_immutable
class PolicyCheckBox extends StatelessWidget {
  PolicyController _policyController = Get.find();
  final String text;
  final int index;
  final bool isAddPolicy;

  PolicyCheckBox(this.text, this.index, {Key? key, this.isAddPolicy = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            value: _policyController.isChecked[index],
            onChanged: (_) => _policyController.changeBox(index),
          ),
          Text(text),
          Spacer(),
          if (isAddPolicy) Text('약관보기', style: Theme.of(context).textTheme.caption),
        ],
      ),
    );
  }
}
