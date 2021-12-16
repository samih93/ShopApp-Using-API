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

  List<dynamic> _sports = [];
  List<dynamic> get sports => _sports;
  List<dynamic> _science = [];
  List<dynamic> get science => _science;

  bool _isloadingBusiness = true;
  bool get isloadingBusiness => _isloadingBusiness;

  bool _isloadingSports = true;
  bool get isloadingSports => _isloadingSports;

  bool _isloadingScience = true;
  bool get isloadingScience => _isloadingScience;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  final screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];

  NewsLayoutController() {
    getAllBusiness();
  }

  void onchangeIndex(int index) {
    _currentIndex = index;
    update();
  }

  getAllBusiness() async {
    _isloadingBusiness = true;
    print("first" + _isloadingBusiness.toString());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '12290ceb1bf34821a6a71f937bb2d815'
    }).then((value) {
      _business = value.data['articles'];
      _isloadingBusiness = false;
      print("last" + _isloadingBusiness.toString());
      update();

      //print(_business.length);
      //print("from new controller :" + value.data['totalResults'].toString());
    }).catchError((error) {
      print(error.toString());
    });
  }

  getAllSports() async {
    _isloadingSports = true;
    print("first" + _isloadingSports.toString());
    if (_sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '12290ceb1bf34821a6a71f937bb2d815'
      }).then((value) {
        _sports = value.data['articles'];
        _isloadingSports = false;
        print("last" + _isloadingSports.toString());
        update();

        //print(_business.length);
        //print("from new controller :" + value.data['totalResults'].toString());
      }).catchError((error) {
        print(error.toString());
      });
    } else {
      _isloadingSports = false;
    }
  }

  getAllScience() async {
    _isloadingScience = true;
    if (_science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '12290ceb1bf34821a6a71f937bb2d815'
      }).then((value) {
        _science = value.data['articles'];
        _isloadingScience = false;
        update();

        //print(_business.length);
        //print("from new controller :" + value.data['totalResults'].toString());
      }).catchError((error) {
        print(error.toString());
      });
    } else {
      _isloadingScience = false;
    }
  }
}
