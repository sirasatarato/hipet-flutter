import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/configs/themes.dart';
import 'package:hipet/src/controller/login_controller.dart';
import 'package:hipet/src/pages/sign/sign_page.dart';
import 'package:hipet/src/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hipet/src/configs/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitBinding(),
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: FutureBuilder(
        future: _getIsLogin(),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData) {
            _loginController.isLogin = snapshot.data;
            return SignPage();
          }

          return SplashPage();
        },
      ),
    );
  }

  _getIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = (prefs.getBool('login') ?? false);
    print('UserLogin: $isLogin');
    return isLogin;
  }
}
