import 'package:flutter/material.dart';
import 'package:udemy_flutter/layout/home_layout.dart';
import 'package:udemy_flutter/layout/home_layoutcontroller.dart';
import 'package:udemy_flutter/modules/login/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/shared/helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeLayoutController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      // bind the dependency
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
