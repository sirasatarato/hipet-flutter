import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditButton extends StatelessWidget {
  final VoidCallback? onTap;

  const EditButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 18,
        decoration: BoxDecoration(
          color: Get.theme.accentColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            'edit',
            style: Get.textTheme.caption!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
