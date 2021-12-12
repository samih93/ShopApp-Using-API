import 'package:flutter/material.dart';
import 'package:udemy_flutter/modules/login/LoginScreen.dart';
import 'package:udemy_flutter/modules/messanger/MessagingScreen.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/BMICalculator.dart';
import 'package:udemy_flutter/Controller/BMIController.dart';
import 'package:udemy_flutter/Controller/helper/Binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
