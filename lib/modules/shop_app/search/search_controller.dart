import 'package:get/get.dart';
import 'package:udemy_flutter/models/shop_app/search_model.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/network/end_point.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper_shop.dart';

class SearchController extends GetxController {
  bool? _isloadingsearch = false;
  bool? get isloadingsearch => _isloadingsearch;

  Searchmodel? _searchmodel;
  Searchmodel? get searchmodel => _searchmodel;

  void search(String qurey) {
    _isloadingsearch = true;
    update();
    DioHelperShop.postData(url: SEARCH, token: token, data: {
      'text': qurey,
    }).then((value) {
      _searchmodel = Searchmodel.fromJson(value.data);
      print("status search :" + _searchmodel!.status.toString());
      _isloadingsearch = false;
      update();
    }).catchError((error) {
      print(error.toString());
    });
  }
}
