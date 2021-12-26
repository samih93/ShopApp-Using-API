import 'package:udemy_flutter/models/shop_app/home_model.dart';

class Searchmodel {
  bool? status;

  String? message;

  SearchData? data;

  Searchmodel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = SearchData.fromJson(json["data"]);
  }
}

class SearchData {
  int? current_index;
  List<ProductModel> ListOfProduct = [];

  SearchData.fromJson(Map<String, dynamic> json) {
    current_index = json["current_page"];
    json["data"].forEach(
        (element) => ListOfProduct.add(ProductModel.fromJson(element)));
  }
}
