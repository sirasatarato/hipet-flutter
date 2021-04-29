import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/controller/policy_controller.dart';

class PolicyCheckBox extends StatelessWidget {
  final PolicyController _policyController = Get.find();
  final String text;
  final int index;
  final bool isAddPolicy;

  PolicyCheckBox(this.text, this.index, {this.isAddPolicy = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: _policyController.isChecked[index],
            onChanged: (_) => _policyController.changeBox(index),
          ),
        ),
        Text(text),
        const Spacer(),
        if (isAddPolicy) Text('약관보기', style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
