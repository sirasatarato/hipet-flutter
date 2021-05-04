import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text('마이페이지'),
        actions: [SvgPicture.asset('assets/icon/svg/bell.svg')],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 112,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 16, 24),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text('밥을 많이 먹는 요요'),
                        Expanded(child: Text('edit')),
                        Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: GridView.count(
          childAspectRatio: Get.width / Get.height,
          crossAxisCount: 3,
          children: [
            Container(),
            Container(color: Colors.grey),
            Container(),
            Container(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
