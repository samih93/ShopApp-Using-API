import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy_flutter/layout/news_app/news_layout.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/layout/social_app/social_layout.dart';
import 'package:udemy_flutter/layout/social_app/social_layout_controller.dart';
import 'package:udemy_flutter/layout/todo_app/todo_layoutcontroller.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/modules/shop_app/onboarding/on_boarding_screen.dart';
import 'package:udemy_flutter/modules/social_app/social_login/social_login.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/helper/binding.dart';
import 'package:udemy_flutter/shared/network/local/cashhelper.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper_news.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper_shop.dart';
import 'package:udemy_flutter/shared/styles/thems.dart';

import 'shared/styles/thems.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on background message');
  print(" message data background " + message.data.toString());
  showToast(message: "on background message", status: ToastStatus.Success);
}

void main() async {
  // NOTE : to run all thing befor runApp()
  WidgetsFlutterBinding.ensureInitialized();

  // NOTE: INITIALIZE FIREBASE
  await Firebase.initializeApp();

// NOTE : Unique token for device
  var messagingToken = await FirebaseMessaging.instance.getToken();
  print("token messaging -- " + messagingToken.toString());

// NOTE : catch notification  with parameter while app is opened  : ForeGroundMessage
  FirebaseMessaging.onMessage.listen((message) {
    print("message data " + message.data.toString());
    showToast(message: "on message", status: ToastStatus.Success);
  });

// NOTE : catch notification  with parameter while app is closed and when on press notification
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print("message data opened " + message.data.toString());
    showToast(message: "on message opened", status: ToastStatus.Success);
  });

// NOTE : catch notification  with parameter while app is in background
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // dio helper is used to call api
  // this come first cz in new controller i use the dio so if i dont use then ,
  // then new layoutcontroller created and call diohelper on null so return business list null
  DioHelperNews.init().then((value) {});

  // NOTE : For shop App ----------------------

  DioHelperShop.init().then((value) {});
  await CashHelper.Init();

// check if no cash data ==> return false
  // bool? onboarding = CashHelper.getData(key: "onBoarding");
  // print(onboarding);
  // NOTE: New
  // token = CashHelper.getData(key: "token") ?? null;
  // print("token :" + token.toString());
  Widget widget;

  // if (onboarding != null) {
  //   if (token != null)
  //     widget = ShopLayout();
  //   else
  //     widget = ShopLoginScreen();
  // } else {
  //   widget = OnBoardingScreen();
  // }

  uId = CashHelper.getData(key: "uId") ?? null;
  print("UId :" + uId.toString());

  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = SocialLoginScreen();
  }

  //NOTE ----------------------------------

  //NOTE : ADD dependencies
  Get.put(NewsLayoutController());
  Get.put(TodoLayoutController());
  Get.put(ShopLayoutController());
  // Get.put(SocialLayoutController());
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  Widget widget;
  MyApp(this.widget);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
      init: Get.find<NewsLayoutController>(),
      builder: (newsLayoutController) => GetMaterialApp(
        // bind the dependency
        theme: lightTheme(),
        darkTheme: darkThem(),
        themeMode:
            newsLayoutController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        //themeMode: ThemeMode.dark,

        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: widget,
      ),
    );
  }
}
