import 'package:flutter/material.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:hipet/src/pages/policy_page.dart';

class SignProcessFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          MfgLabs.left,
          size: 16,
          color: Colors.black,
        ),
        title: Text(
          '이용 약관',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: PolicyPage(),
    );
  }
}
