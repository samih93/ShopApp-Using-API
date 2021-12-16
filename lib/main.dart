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
    return GetMaterialApp(
      // bind the dependency
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            actionsIconTheme: IconThemeData(color: Colors.black),
            backwardsCompatibility: false,
            titleTextStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            )),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,

      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: NewsLayout(),
    );
  }
}
