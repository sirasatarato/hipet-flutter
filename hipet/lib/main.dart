import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/configs/themes.dart';
import 'package:hipet/src/controller/user_info_controller.dart';
import 'package:hipet/src/pages/sign/sign_page.dart';
import 'package:hipet/src/pages/splash_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  await Hive.openBox('sign');
  await Hive.openBox('content');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() => Get.put<UserInfoController>(UserInfoController())),
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: FutureBuilder(
        future: _getIsLogin(),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return SignPage();
          }

          return SplashPage();
        },
      ),
    );
  }

  _getIsLogin() async {
    Box box = Hive.box('sign');
    bool isLogin = (box.get('login') ?? false);
    print('UserLogin: $isLogin');
    return isLogin;
  }
}
