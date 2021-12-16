import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy_flutter/layout/news_app/news_layout.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/layout/todo_app/todo_layout.dart';
import 'package:udemy_flutter/layout/todo_app/todo_layoutcontroller.dart';
import 'package:udemy_flutter/modules/login/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/shared/helper/binding.dart';
import 'package:udemy_flutter/shared/network/local/TodoDbHelper.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper.dart';
import 'package:hexcolor/hexcolor.dart';

import 'shared/componets/thems.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(NewsLayoutController());
  Get.put(TodoLayoutController());
  //DioHelper.Init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        home: NewsLayout(),
      ),
    );
  }
}
