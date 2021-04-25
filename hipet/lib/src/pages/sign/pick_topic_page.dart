import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/widgets/widest_button.dart';

import 'join_fin_page.dart';

class PickTopicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 6;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('다음에 선택하기'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text('좋아하는 동물을 선택해주세요.'),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width),
                child: GridView.count(
                  mainAxisSpacing: 24,
                  crossAxisSpacing: width,
                  crossAxisCount: 2,
                  children: [
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                    Container(color: Colors.black),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 32),
              child: GestureDetector(
                onTap: () => Get.to(() => JoinFinPage()),
                child: Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 48,
                  child: WidestButton('다 골랐어요!'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
