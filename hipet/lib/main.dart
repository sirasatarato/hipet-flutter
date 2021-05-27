import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hipet/src/configs/themes.dart';
import 'package:hipet/src/controller/login_controller.dart';
import 'package:hipet/src/pages/sign/sign_page.dart';
import 'package:hipet/src/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hipet/src/configs/binding.dart';

import 'src/util/sharedpreferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});
  SharedPreferencesManager().preferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitBinding(),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: getThemeData(),
      home: FutureBuilder(
        future: _getIsLogin(),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
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
