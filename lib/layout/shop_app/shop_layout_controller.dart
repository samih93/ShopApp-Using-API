import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/models/shop_app/category_model.dart';
import 'package:udemy_flutter/models/shop_app/change_favorite_model.dart';
import 'package:udemy_flutter/models/shop_app/favorites_model.dart';
import 'package:udemy_flutter/models/shop_app/home_model.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/shop_app/categories/category_screen.dart';
import 'package:udemy_flutter/modules/shop_app/favorites/favorite_screen.dart';
import 'package:udemy_flutter/modules/shop_app/products/product_screen.dart';
import 'package:udemy_flutter/modules/shop_app/settings/setting_screen.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/network/end_point.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper_shop.dart';
import 'dart:convert';

class ShopLayoutController extends GetxController {
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Categories"),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "Favorites",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];
  final screens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];

// NOTE: first call for  constructor  i retreive needs data
  ShopLayoutController() {
    //FIXME :
    // getHomeData();
    // getCategories();
    // getFavorites();
    // getUserProfile();
  }

  // NOTE: --------------------- On Change Index Of Screens ------------------

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onchangeIndex(int index) {
    _currentIndex = index;
    update();
  }

  // NOTE: ---------------------  Get Home Data ------------------

  bool _isloadinghome = true;

  bool get isloadinghome => _isloadinghome;
  HomeModel? _homeModel;

  HomeModel? get homeModel => _homeModel;

  void getHomeData() {
    _isloadinghome = true;
    DioHelperShop.getData(url: HOME, token: token).then((value) {
      // print(value.data.toString());
      _homeModel = HomeModel.fromJson(value.data);
      _homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id: element.in_favorites,
        });
      });

      // print(favorites.toString());

      _isloadinghome = false;
      update();
    }).catchError((error) {
      print(error);
    });
  }

  // NOTE: --------------------- Get Categories -------------------

  bool _isloadingcategories = true;

  bool get isloadingcategories => _isloadingcategories;
  CategoriesModel? _categoriesModel;

  CategoriesModel? get categoriesModel => _categoriesModel;

  void getCategories() {
    _isloadingcategories = true;
    DioHelperShop.getData(url: GET_CATEGORIES, token: token).then((value) {
      //print(value.data.toString());
      _categoriesModel = CategoriesModel.fromJson(value.data);
      _isloadingcategories = false;
      update();
    }).catchError((error) {
      print(error);
    });
  }

  // NOTE: --------------------- Change favorites -------------------

  Map<int?, bool?> favorites = {};

  ChangeFavoritesModel? _changeFavoritesModel;

  ChangeFavoritesModel? get changeFavoritesModel => _changeFavoritesModel;

  Future<ChangeFavoritesModel?> changeFavorites(int productId) async {
    favorites[productId] = !(favorites[productId] as bool);
    update();
    DioHelperShop.postData(
        url: FAVORITES,
        token: token,
        data: {'product_id': productId}).then((value) {
      _changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if (_changeFavoritesModel!.status == false) {
        favorites[productId] = !(favorites[productId] as bool);
      } else {
        getFavorites();
      }
      print("Favorite Updated");
      update();
      return _changeFavoritesModel;
    }).catchError(
        (error) => favorites[productId] = !(favorites[productId] as bool));
    return _changeFavoritesModel;
  }

  // NOTE: --------------------- Get favorites -------------------
  Favoritesmodel? _favoritesmodel;

  Favoritesmodel? get favoritesmodel => _favoritesmodel;

  bool? _isloadingfavorites;

  bool? get isloadingfavorites => _isloadingfavorites;

  void getFavorites() {
    // to remove without laoding favorite
    //if(_favoritesmodel !=null && _favoritesmodel!.data!.ListOfFavoriteModel.length<=0)
    _isloadingfavorites = true;
    DioHelperShop.getData(url: FAVORITES, token: token).then((value) {
      _favoritesmodel = Favoritesmodel.fromJson(value.data);
      // print("favorites status : "+_favoritesmodel!.status.toString());
      print("favorites lenght : " +
          _favoritesmodel!.data!.ListOfFavoriteModel.length.toString());
      _isloadingfavorites = false;
      update();
    }).catchError((error) {
      print(error);
    });
  }

  // NOTE: --------------------- Get User Profile -------------------

  bool? _isloadingUserProfile;

  bool? get isloadingUserProfile => _isloadingUserProfile;
  ShopLoginModel? _shopLoginModel;

  ShopLoginModel? get shopLoginModel => _shopLoginModel;

  void getUserProfile() {
    // to remove without laoding favorite
    //if(_favoritesmodel !=null && _favoritesmodel!.data!.ListOfFavoriteModel.length<=0)
    _isloadingUserProfile = true;
    DioHelperShop.getData(url: PROFILE, token: token).then((value) {
      _shopLoginModel = ShopLoginModel.fromJson(value.data);
      print(_shopLoginModel!.userData!.name);

      _isloadingUserProfile = false;
      update();
    }).catchError((error) {
      print(error);
    });
  }

  // NOTE:  --------------------- Update User Data -------------------
  bool? _isloadingupdate = false;

  bool? get isloadingupdate => _isloadingupdate;

  Future<ShopLoginModel?> updateUserData(
      {required String name,
      required String phone,
      required String email}) async {
    ShopLoginModel? shopLoginMode = null;
    _isloadingupdate = true;
    update();
    await DioHelperShop.putData(url: UPDATE_PROFILE, token: token, data: {
      "name": name,
      "phone": phone,
      "email": email,
    }).then((value) {
      _shopLoginModel = ShopLoginModel.fromJson(value.data);
      shopLoginMode = ShopLoginModel.fromJson(value.data);

      // print(_shopLoginModel!.userData!.name);

      _isloadingupdate = false;
      update();
    }).catchError((error) {
      print(error);
    });
    return shopLoginMode;
  }

  // NOTE: ---------------------  User Login --------------

  bool _showpassword = true;
  bool get showpassword => _showpassword;

  bool _isloadingLogin = false;
  bool get isloadingLogin => _isloadingLogin;

  onObscurePassword() {
    _showpassword = !showpassword;
    update();
  }

  Future<ShopLoginModel?> userlogin(
      {required String email, required String password}) async {
    ShopLoginModel? shopLoginMode = null;
    _isloadingLogin = true;
    update();
    print("first:" + _isloadingLogin.toString());
    await DioHelperShop.postData(
        url: LOGIN, data: {"email": email, "password": password}).then((value) {
      print(value.data.toString());
      shopLoginMode = ShopLoginModel.fromJson(value.data);
      _isloadingLogin = false;
      print("last:" + _isloadingLogin.toString());
      update();
    }).catchError((error) {
      print(error.toString());
    });

    return shopLoginMode;
  }

  // NOTE: --------------------- Resgister New User --------------
  bool? _isloadingRegister = false;
  bool? get isloadingRegister => _isloadingRegister;

  Future<ShopLoginModel?> registerUser(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    _isloadingRegister = true;
    update();
    DioHelperShop.postData(url: REGISTER, token: token, data: {
      'name': name,
      'email': email,
      'password': password,
      "phone": phone
    }).then((value) {
      print(value.data.toString());
      _shopLoginModel = ShopLoginModel.fromJson(value.data);
      _isloadingLogin = false;
      print("last:" + _isloadingLogin.toString());
      update();
    }).catchError((error) {
      print(error.toString());
    });

    return _shopLoginModel;
  }
}
