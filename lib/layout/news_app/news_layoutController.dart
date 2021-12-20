import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/modules/news_app/business/business_screen.dart';
import 'package:udemy_flutter/modules/news_app/sicence/science_screen.dart';
import 'package:udemy_flutter/modules/news_app/sport/sport_screen.dart';
import 'package:udemy_flutter/shared/network/local/cashhelper.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper_news.dart';

class NewsLayoutController extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  List<dynamic> _business = [];
  List<dynamic> get business => _business;

  List<dynamic> _sports = [];
  List<dynamic> get sports => _sports;
  List<dynamic> _science = [];
  List<dynamic> get science => _science;
  List<dynamic> _search = [];
  List<dynamic> get search => _search;

  bool _isloadingBusiness = true;
  bool get isloadingBusiness => _isloadingBusiness;

  bool _isloadingSports = true;
  bool get isloadingSports => _isloadingSports;

  bool _isloadingScience = true;
  bool get isloadingScience => _isloadingScience;

  bool _isloadingSearch = true;
  bool get isloadingSearch => _isloadingSearch;

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  final screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  NewsLayoutController() {
    bool? isdarkcashedthem = CashHelper.getThem(key: "isdark");
    if (isdarkcashedthem != null) {
      _isDarkMode = isdarkcashedthem;
    }
    getAllBusiness();
  }

  void onchangeIndex(int index) {
    _currentIndex = index;
    update();
  }

  void onchangeThem() {
    _isDarkMode = !isDarkMode;
    CashHelper.setTheme(key: "isdark", value: _isDarkMode).then((value) {});
    update();
  }

  getAllBusiness() async {
    _isloadingBusiness = true;
    print("first" + _isloadingBusiness.toString());
    DioHelperNews.getData(url: 'v2/top-headlines', query: {
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
      DioHelperNews.getData(url: 'v2/top-headlines', query: {
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
      DioHelperNews.getData(url: 'v2/top-headlines', query: {
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
      update();
    }
  }

  void getSearch(String search) {
    _isloadingSearch = true;
    DioHelperNews.getData(url: 'v2/everything', query: {
      'q': '$search',
      'apiKey': '12290ceb1bf34821a6a71f937bb2d815'
    }).then((value) {
      _search = value.data['articles'];
      _isloadingSearch = false;
      update();

      //print(_business.length);
      //print("from new controller :" + value.data['totalResults'].toString());
    }).catchError((error) {
      print(error.toString());
    });
  }
}
