import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/layout/todo_app/todo_layoutcontroller.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/modules/shop_app/onboarding/on_boarding_screen.dart';
import 'package:udemy_flutter/shared/helper/binding.dart';
import 'package:udemy_flutter/shared/network/local/cashhelper.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper_news.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper_shop.dart';
import 'package:udemy_flutter/shared/styles/thems.dart';

import 'shared/styles/thems.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // dio helper is used to call api
  // this come first cz in new controller i use the dio so if i dont use then ,
  // then new layoutcontroller created and call diohelper on null so return business list null
  // DioHelperNews.init().then((value) {});
  DioHelperShop.init().then((value) {});
  await CashHelper.Init();

  bool onboarding = CashHelper.getData(key: "onBoarding");
  print(onboarding);
  Get.put(NewsLayoutController());
  Get.put(TodoLayoutController());
  runApp(MyApp(onboarding));
}

class MyApp extends StatelessWidget {
  bool onboarding;
  MyApp(this.onboarding);
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

        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: onboarding ? ShopLoginScreen() : OnBoardingScreen(),
      ),
    );
  }
}
