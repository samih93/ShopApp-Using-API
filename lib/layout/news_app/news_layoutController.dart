import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/modules/business/business_screen.dart';
import 'package:udemy_flutter/modules/settings/setting_screen.dart';
import 'package:udemy_flutter/modules/sicence/science_screen.dart';
import 'package:udemy_flutter/modules/sport/sport_screen.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper.dart';

class NewsLayoutController extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  List<dynamic> _business = [];
  List<dynamic> get business => _business;

  RxBool isloading = true.obs;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  final screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
    SettingsScreen()
  ];

  void onchangeIndex(int index) {
    _currentIndex = index;
    update();
  }
}
