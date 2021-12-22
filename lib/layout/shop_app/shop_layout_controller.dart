import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/models/shop_app/category_model.dart';
import 'package:udemy_flutter/models/shop_app/home_model.dart';
import 'package:udemy_flutter/modules/shop_app/categories/category_screen.dart';
import 'package:udemy_flutter/modules/shop_app/favorites/favorite_screen.dart';
import 'package:udemy_flutter/modules/shop_app/products/product_screen.dart';
import 'package:udemy_flutter/modules/shop_app/settings/setting_screen.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/network/end_point.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper_shop.dart';

class ShopLayoutController extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _isloadinghome = true;
  bool get isloadinghome => _isloadinghome;
  HomeModel? _homeModel;
  HomeModel? get homeModel => _homeModel;


  bool _isloadingcategories = true;
  bool get isloadingcategories => _isloadingcategories;
  CategoriesModel? _categoriesModel;
  CategoriesModel? get categoriesModel => _categoriesModel;


  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.category_outlined), label: "Categories"),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "Favorites",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];

  ShopLayoutController() {
    print("status ");
    getHomeData();
    getCategories();
  }

  final screens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];

  void onchangeIndex(int index) {
    _currentIndex = index;
    update();
  }

  void getHomeData() {
    _isloadinghome = true;
    DioHelperShop.getData(url: HOME, token: token).then((value) {
     // print(value.data.toString());
      _homeModel = HomeModel.fromJson(value.data);
    //  print(_homeModel!.data!.banners[0].image.toString());
      // print("afterstatus ");
      // printFullText(_homeModel.toString());
      _isloadinghome = false;
      update();
    }).catchError((error) {
      print(error);
    });
  }

  void getCategories() {
    _isloadingcategories = true;
    DioHelperShop.getData(url: GET_CATEGORIES, token: token).then((value) {
      print(value.data.toString());
      _categoriesModel = CategoriesModel.fromJson(value.data);
     // print(_homeModel!.data!.banners[0].image.toString());
      // print("afterstatus ");
      // printFullText(_homeModel.toString());
      _isloadingcategories = false;
      update();
    }).catchError((error) {
      print(error);
    });
  }
}
