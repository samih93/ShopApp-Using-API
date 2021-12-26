import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/models/shop_app/favorites_model.dart';
import 'package:udemy_flutter/models/shop_app/home_model.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopLayoutController>(
      init: Get.find<ShopLayoutController>(),
      builder: (shopLayoutController) => Scaffold(
        appBar: AppBar(),
        body: shopLayoutController.isloadingfavorites == true
            ? Center(child: CircularProgressIndicator())
            : shopLayoutController
                        .favoritesmodel!.data!.ListOfFavoriteModel.length ==
                    0
                ? Center(child: Text("Favorite List is Empty"))
                : ListView.separated(
                    itemBuilder: (context, index) => buildFavoriteItem(
                        shopLayoutController.favoritesmodel!.data!
                            .ListOfFavoriteModel[index].productModel),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: shopLayoutController
                        .favoritesmodel!.data!.ListOfFavoriteModel.length),
      ),
    );
  }
}
