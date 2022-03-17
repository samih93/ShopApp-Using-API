import 'package:udemy_flutter/models/home_model.dart';

class Favoritesmodel {
  bool? status;

  String? message;

  FavoritesData? data;

  Favoritesmodel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = FavoritesData.fromJson(json["data"]);
  }
}

class FavoritesData {
  int? current_index;
  List<FavoriteModel> ListOfFavoriteModel = [];

  FavoritesData.fromJson(Map<String, dynamic> json) {
    current_index = json["current_page"];
    json["data"].forEach(
        (element) => ListOfFavoriteModel.add(FavoriteModel.fromJson(element)));
  }
}

class FavoriteModel {
  int? id;
  ProductModel? productModel;

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    productModel =
        json["product"] != null ? ProductModel.fromJson(json["product"]) : null;
  }
}
