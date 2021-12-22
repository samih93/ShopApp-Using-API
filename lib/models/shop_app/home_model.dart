import 'dart:convert';

import 'package:flutter/cupertino.dart';

class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;

    status = json["status"];
    data = HomeDataModel.fromJson(json["data"]);
  }
}

class HomeDataModel {
  List<BannerModel> banners = [];
  List<ProductModel> products = [];
  String? ad;

  // HomeDataModel(
  //     {required this.banners, required this.products, required this.ad});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json["banners"] != null)
      json["banners"].forEach((element) {
        banners.add(BannerModel.fromJson(element));
      });
    if (json["products"] != null)
      json["products"].forEach((element) {
        products.add(ProductModel.fromJson(element));
      });
    ad = json["ad"];
  }
}

class BannerModel {
  int? id;
  String? image;

  BannerModel({
    required this.id,
    required this.image,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;

    id = json["id"];
    image = json["image"];
  }
}

class ProductModel {
  int? id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String? image;
  bool? in_favorites;
  bool? in_cart;

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;

    id = json["id"];
    price = json["price"];
    old_price = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    in_favorites = json["in_favorites"];
    in_cart = json["in_cart"];
  }
  toJson() {
    return {
      'id': id,
      'price': price,
      'old_price': old_price,
      'discount': discount,
      'image': image,
      'in_favorites': in_favorites! ? 1 : 0,
      'in_cart': in_cart! ? 1 : 0,
      // cast bool
    };
  }
}
